package com.yunjian.core.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Account;
import com.yunjian.core.service.IAccountService;

@RestController
@RequestMapping("/api/account")
public class AccountController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IAccountService accountServiceImpl;
	
	/**
	 *修改用户信息
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/modifyAccountInfo", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto modifyAccountInfo(@RequestBody Account param) {
		logger.info("修改用户信息{}", JsonUtil.toJsonString(param));
		return accountServiceImpl.modifyAccountInfo(param);
	}
	
	/**
	 *修改用户密码
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/modifyPassword", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto modifyPassword(@RequestBody Account param) {
		logger.info("修改用户密码{}", JsonUtil.toJsonString(param));
		if(StringUtils.isEmpty(param.getPassword())) {
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "请填写密码");
		}
		return accountServiceImpl.modifyPassword(param);
	}
}
