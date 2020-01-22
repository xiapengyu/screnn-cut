package com.yunjian.core.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.AccountDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Account;
import com.yunjian.core.service.IAccountService;
import com.yunjian.core.service.IEmailCodeService;

import jodd.util.StringUtil;

@RestController
@RequestMapping("/account")
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
		if(StringUtil.isEmpty(param.getEmail())) {
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
		if(StringUtil.isEmpty(param.getEmail()) || StringUtil.isEmpty(param.getPassword())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "邮箱、密码不能为空");
		}else if(StringUtil.isEmpty(param.getSerialNo())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "注册序列号不能为空");
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
		if(StringUtil.isEmpty(param.getEmail()) || StringUtil.isEmpty(param.getPassword())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "邮箱、密码不能为空");
		}
		return accountServiceImpl.login(param);
	}
	
	/**
	 * 退出登录
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto logout() {
		return accountServiceImpl.logout();
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
		if(StringUtil.isEmpty(param.getEmail()) || StringUtil.isEmpty(param.getPassword())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "邮箱或密码不能为空");
		}else if(StringUtil.isEmpty(param.getCode())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "验证码不能为空");
		}else if(!param.getPassword().equals(param.getConfirmPassword())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "两次输入的密码不一致");
		}else if(StringUtil.isEmpty(param.getSerialNo())) {
			return new ResponseDto(Constant.FAIL_CODE, null, "机器序列码不能为空");
		}
		return accountServiceImpl.resetPassword(param);
	}

}
