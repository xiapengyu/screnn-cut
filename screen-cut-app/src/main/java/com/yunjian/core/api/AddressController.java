package com.yunjian.core.api;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.Address;
import com.yunjian.core.service.IAddressService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
@RestController
@RequestMapping("/api/address")
public class AddressController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IAddressService addressServiceImpl;
	
	/**
	 *分页查询用户地址信息
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/queryPage", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto queryPage(@RequestBody Map<String, Object> param) {
		logger.info("分页查询用户地址信息{}", JsonUtil.toJsonString(param));
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		try {
			PageUtils page = addressServiceImpl.queryPage(param);
			response.setData(page);
		} catch (Exception e) {
			logger.error("分页查询用户地址信息失败", e);
			return new ResponseDto(Constant.FAIL_CODE, null, "分页查询用户地址信息失败");
		}
		return response;
	}
	
	/**
	 *保存用户地址信息
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/saveAddress", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto saveAddress(@RequestBody Address param) {
		logger.info("保存用户地址信息{}", JsonUtil.toJsonString(param));
		if(param.getProvinceId() == null || param.getCityId() == null || param.getDistrictId() == null
				|| StringUtils.isEmpty(param.getAddress()) || StringUtils.isEmpty(param.getUserName()) || StringUtils.isEmpty(param.getPhone())
				|| param.getIsDefault() == null){
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
		}
		return addressServiceImpl.saveAddress(param);
	}
	
	/**
	 *删除用户地址信息
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/deleteAddress", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto deleteAddress(@RequestBody Address param) {
		logger.info("删除用户地址信息{}", JsonUtil.toJsonString(param));
		if(param.getId() == null) {
			return new ResponseDto(Constant.FAIL_CODE, null, "参数错误");
		}
		return addressServiceImpl.deleteAddress(param);
	}
	
	/**
	 *设为默认收货地址
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/setDefaultAddress", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto setDefaultAddress(@RequestBody Address param) {
		logger.info("设为默认收货地址{}", JsonUtil.toJsonString(param));
		if(param.getId() == null) {
			return new ResponseDto(Constant.FAIL_CODE, null, "参数错误");
		}
		return addressServiceImpl.setDefaultAddress(param);
	}
	
	/**
	 *获取用户默认地址信息
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/getDefaultAddress", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto getDefaultAddress(@RequestBody Map<String, Object> param) {
		logger.info("获取用户默认地址信息{}", JsonUtil.toJsonString(param));
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		Account account = SecurityContext.getUserPrincipal();
		Address defaultAddress = addressServiceImpl
				.getOne(new QueryWrapper<Address>().eq("account_id", account.getId()).eq("is_default", 1));
		response.setData(defaultAddress);
		return response;
	}

	/**
	 *查询用户地址详情
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/getAddressDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto getAddressDetail(@RequestBody Map<String, Object> param) {
		logger.info("查询用户地址详情{}", JsonUtil.toJsonString(param));
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		String addressId = StringUtil.obj2String(param.get("id"));
		if(StringUtils.isEmpty(addressId)){
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
		}
		Address address = addressServiceImpl
				.getOne(new QueryWrapper<Address>().eq("id", Integer.parseInt(addressId)));
		response.setData(address);
		return response;
	}

}
