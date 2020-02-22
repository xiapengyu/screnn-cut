package com.yunjian.core.api;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Address;
import com.yunjian.core.service.IRegionService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
@RestController
@RequestMapping("/app/region")
public class RegionController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IRegionService regionServiceImpl;
	
	/**
	 *查询省份列表
	 * @return
	 */
	@RequestMapping(value="/queryProvinceList", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto queryProvinceList() {
		logger.info("查询省份列表");
		return regionServiceImpl.queryProvinceList();
	}
	
	/**
	 *根据省份查询城市列表
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/queryCityList", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto queryCityList(@RequestBody Address param) {
		logger.info("根据省份查询城市列表{}", JsonUtil.toJsonString(param));
		return regionServiceImpl.queryCityList(param);
	}
	
	/**
	 *根据城市查询区县列表
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/queryDistributeList", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto queryDistributeList(@RequestBody Address param) {
		logger.info("根据城市查询区县列表{}", JsonUtil.toJsonString(param));
		return regionServiceImpl.queryDistributeList(param);
	}

}
