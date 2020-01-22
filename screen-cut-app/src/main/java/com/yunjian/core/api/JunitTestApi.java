package com.yunjian.core.api;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.AccountCache;
import com.yunjian.core.service.IAccountCacheService;

@RestController
@RequestMapping("/app/test")
public class JunitTestApi {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IAccountCacheService accountCacheServiceImpl; 
	
	@RequestMapping("/print")
	@ResponseBody
	public ResponseDto print(@RequestBody Map<String, Object> param) {
		logger.info("调试参数{}", JsonUtil.toJsonString(param));
		ResponseDto res = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		res.setData(param);
		return res;
	}
	
	@RequestMapping("/print_2")
	@ResponseBody
	public ResponseDto print_2(@RequestBody Map<String, Object> param) {
		logger.info("调试参数{}", JsonUtil.toJsonString(param));
		ResponseDto res = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		List<AccountCache> list =  accountCacheServiceImpl.list();
		res.setData(list);
		return res;
	}

}
