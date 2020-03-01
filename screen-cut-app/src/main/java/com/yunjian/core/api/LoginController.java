package com.yunjian.core.api;

import java.util.Date;

import com.yunjian.common.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.AccountDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.EmailCode;
import com.yunjian.core.service.IAccountService;
import com.yunjian.core.service.IEmailCodeService;

import io.swagger.annotations.Api;

@Api("用户账号与登录相关接口")
@RestController
@RequestMapping("/app/account")
public class LoginController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IEmailCodeService emailCodeServiceImpl;
	
	@Autowired
	private IAccountService accountServiceImpl;
	
	/**
	 * 获取邮箱验证码
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/getEmailCode", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto getEmailCode(@RequestBody Account param) {
		logger.info("获取邮箱验证码{}", JsonUtil.toJsonString(param));
		if(StringUtils.isEmpty(param.getEmail())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "请输入正确的邮箱地址");
		}
		return emailCodeServiceImpl.sendEmailCode(param);
	}
	
	/**
	 * 用户注册
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/register", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto register(@RequestBody AccountDto param) {
		logger.info("用户注册{}", JsonUtil.toJsonString(param));
		if(StringUtils.isEmpty(param.getEmail()) || StringUtils.isEmpty(param.getPassword())
				|| StringUtils.isEmpty(param.getSerialNo()) || StringUtils.isEmpty(param.getCode())) {
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_CHECK_MSG);
		}
		if(StringUtils.isEmpty(param.getEmail()) || StringUtils.isEmpty(param.getPassword())){
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "邮箱或密码不能为空");
		}else if(StringUtils.isEmpty(param.getSerialNo())){
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "机器序列号不能为空");
		}else if(StringUtils.isEmpty(param.getCode())){
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "验证码不能为空");
		}
		return accountServiceImpl.register(param);
	}
	
	/**
	 * 用户登录
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/login", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto login(@RequestBody Account param) {
		logger.info("用户登录{}", JsonUtil.toJsonString(param));
		if(StringUtils.isEmpty(param.getEmail()) || StringUtils.isEmpty(param.getPassword())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "邮箱、密码不能为空");
		}
		return accountServiceImpl.login(param);
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto logout() {
		return accountServiceImpl.logout();
	}

	/**
	 * 重置密码前校验验证码
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/checkVerifyCode", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto checkVerifyCode(@RequestBody AccountDto param) {
		logger.info("重置密码前校验验证码{}", JsonUtil.toJsonString(param));
		if(StringUtils.isEmpty(param.getEmail()) || StringUtils.isEmpty(param.getCode())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "邮箱或验证码不能为空");
		}
		try {
			EmailCode emalCode = emailCodeServiceImpl.getOne(new QueryWrapper<EmailCode>().eq("code", param.getCode())
					.eq("email", param.getEmail()).eq("delete_flag", 1).gt("expire_time", new Date()));
			if (emalCode != null) {
				// 删除验证码
				emailCodeServiceImpl.remove(new QueryWrapper<EmailCode>().eq("id", emalCode.getId()));
				return new ResponseDto(Constant.SUCCESS_CODE, null, "验证码校验通过");
			} else {
				return new ResponseDto(Constant.FAIL_CODE, null, "验证码错误");
			}
		} catch (Exception e) {
			logger.error("验证码校验发生异常", e);
			return new ResponseDto(Constant.FAIL_CODE, null, "验证码校验发生异常");
		}
	}

	/**
	 * 重置密码
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/resetPassword", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto resetPassword(@RequestBody AccountDto param) {
		logger.info("重置密码{}", JsonUtil.toJsonString(param));
		if(StringUtils.isEmpty(param.getEmail()) || StringUtils.isEmpty(param.getPassword())) {
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "邮箱或密码不能为空");
		}else if(StringUtils.isEmpty(param.getCode())){
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "验证码不能为空");
		}
		return accountServiceImpl.resetPassword(param);
	}

}
