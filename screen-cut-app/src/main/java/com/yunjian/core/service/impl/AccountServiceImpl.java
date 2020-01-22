package com.yunjian.core.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.MD5Util;
import com.yunjian.common.utils.UUIDUtil;
import com.yunjian.core.dto.AccountDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.AccountCache;
import com.yunjian.core.entity.EmailCode;
import com.yunjian.core.mapper.AccountMapper;
import com.yunjian.core.service.IAccountCacheService;
import com.yunjian.core.service.IAccountService;
import com.yunjian.core.service.IEmailCodeService;

/**
 * <p>
 * APP用户账户表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-21
 */
@Service
public class AccountServiceImpl extends ServiceImpl<AccountMapper, Account> implements IAccountService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IEmailCodeService emailCodeServiceImpl;
	
	@Autowired
	private IAccountCacheService accountCacheServiceImpl;

	@Override
	public ResponseDto register(AccountDto param) {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		try {
				Account account = new Account();
				account.setEmail(param.getEmail());
				account.setPassword(MD5Util.getMD5String(param.getPassword()));
				account.setAvatar("");
				account.setSerialNo(param.getSerialNo());
				account.setCreateTime(new Date());
				account.setUpdateTime(new Date());
				account.setDeleteFlag(1);
				this.save(account);
		} catch (Exception e) {
			logger.error("用户注册失败", e);
			return new ResponseDto(Constant.FAIL_CODE, null, "用户注册失败");
		}
		return response;
	}

	@Override
	public ResponseDto login(Account param) {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		try {
			Account account = this.getOne(new QueryWrapper<Account>().eq("email", param.getEmail())
					.eq("password", MD5Util.getMD5String(param.getPassword())));
			if(account != null) {
				//删除旧缓存
				accountCacheServiceImpl.remove(new QueryWrapper<AccountCache>().eq("account_id", account.getId()));
				
				//保存新的缓存
				String token = UUIDUtil.getUUID();
				AccountCache cache = new AccountCache();
				cache.setAccountId(account.getId());
				cache.setAccountInfo(JsonUtil.toJsonString(account));
				long expireTime = new Date().getTime() + 1000 * 60 * 120;
				cache.setExpireTime(new Date(expireTime));
				cache.setUpdateTime(new Date());
				cache.setToken(token);
				accountCacheServiceImpl.save(cache);
				//保存到会话
				SecurityContext.setUserPrincipal(account);
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("account", account);
				resultMap.put("token", token);
				response.setData(resultMap);
			}else {
				return new ResponseDto(Constant.FAIL_CODE, null, "用户名或密码错误");
			}
		} catch (Exception e) {
			logger.error("登录失败", e);
			return new ResponseDto(Constant.FAIL_CODE, null, "登录失败");
		}
		return response;
	}

	@Override
	public ResponseDto logout() {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		try {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
					.getRequest();
			String requestToken = request.getHeader("token");
			logger.info("用户退出登录,token>>>[{}]", requestToken);
			AccountCache cache = accountCacheServiceImpl.getOne(new QueryWrapper<AccountCache>().eq("token", requestToken));
			if(cache != null) {
				Account account = this.getOne(new QueryWrapper<Account>().eq("id", cache.getAccountId()));
				logger.info("用户退出登录{}", JsonUtil.toJsonString(account));
				//清空会话
				SecurityContext.setUserPrincipal(null);
				//删除缓存
				accountCacheServiceImpl.remove(new QueryWrapper<AccountCache>().eq("account_id", account.getId()));
			}
		} catch (Exception e) {
			logger.error("退出登录失败", e);
			return new ResponseDto(Constant.FAIL_CODE, null, "退出登录失败");
		}
		return response;
	}

	@Override
	public ResponseDto resetPassword(AccountDto param) {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		try {
			EmailCode emalCode = emailCodeServiceImpl.getOne(new QueryWrapper<EmailCode>()
					.eq("code", param.getCode()).eq("email", param.getEmail())
					.eq("delete_flag", 1).gt("expire_time", new Date()));
			if(emalCode != null) {
				Account account = this.getOne(new QueryWrapper<Account>().eq("email", param.getEmail())
						.eq("serial_no", param.getSerialNo()));
				if(account == null) {
					return new ResponseDto(Constant.FAIL_CODE, null, "未查到相关用户");
				}else {
					//更新用户信息
					account.setPassword(MD5Util.getMD5String(param.getPassword()));
					this.saveOrUpdate(account);
				}
				//删除验证码
				emailCodeServiceImpl.remove(new QueryWrapper<EmailCode>().eq("id", emalCode.getId()));
			}else {
				return new ResponseDto(Constant.FAIL_CODE, null, "验证码错误");
			}
		} catch (Exception e) {
			logger.error("重置密码失败", e);
			return new ResponseDto(Constant.FAIL_CODE, null, "重置密码失败");
		}
		return response;
	}

}
