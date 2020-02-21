package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Address;

import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
public interface IAddressService extends IService<Address> {

	ResponseDto saveAddress(Address param);

	ResponseDto deleteAddress(Address param);

	ResponseDto setDefaultAddress(Address param);

	PageUtils queryPage(Map<String, Object> param);

}
