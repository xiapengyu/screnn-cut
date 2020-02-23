package com.yunjian.core.api;

import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Account;
import com.yunjian.core.service.IAccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
}
