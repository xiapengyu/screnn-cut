package com.yunjian.core.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yunjian.common.utils.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.Address;
import com.yunjian.core.mapper.AddressMapper;
import com.yunjian.core.service.IAddressService;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements IAddressService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public ResponseDto saveAddress(Address param) {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		try {
			Address address = null;
			if (param.getId() != null && param.getId() > 0) {
				address = this.getOne(new QueryWrapper<Address>().eq("id", param.getId()));
				address.setUpdateTime(new Date());
			} else {
				address = new Address();
				address.setCreateTime(new Date());
				address.setUpdateTime(new Date());
				address.setDeleteFlag(1);
			}
			
			Account account = SecurityContext.getUserPrincipal();
			address.setAccountId(account.getId());
			address.setUserName(param.getUserName());
			address.setPhone(param.getPhone());
			address.setAddress(param.getAddress());

			Address defaultAddress = this
					.getOne(new QueryWrapper<Address>().eq("account_id", account.getId()).eq("is_default", 1));
			if (defaultAddress != null && defaultAddress.getId() != param.getId() && param.getIsDefault() == 1) {
				defaultAddress.setIsDefault(0);
				this.saveOrUpdate(defaultAddress);
			}

			//首次添加设为默认
			List<Address> userAddressList = this.list(new QueryWrapper<Address>().eq("account_id", account.getId()));
			if(userAddressList.isEmpty()){
				address.setIsDefault(1);
			}else{
				address.setIsDefault(param.getIsDefault());
			}
			logger.info("保存的地址信息{}", JsonUtil.toJsonString(address));
			this.saveOrUpdate(address);
		} catch (Exception e) {
			logger.error("保存地址出错", e);
			return new ResponseDto(Constant.FAIL_CODE, null, LanguageUtils.getValueByKey("address.save.error"));
		}
		return response;
	}

	@Override
	public ResponseDto deleteAddress(Address param) {
		Account account = SecurityContext.getUserPrincipal();
		Address defaultAddress = this
				.getOne(new QueryWrapper<Address>().eq("account_id", account.getId()).eq("is_default", 1));
		if(defaultAddress != null && defaultAddress.getId() == param.getId()){
			return new ResponseDto(Constant.FAIL_CODE, null, LanguageUtils.getValueByKey("address.delete.default.error"));
		}
		this.remove(new QueryWrapper<Address>().eq("id", param.getId()));
		return new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
	}

	@Override
	public ResponseDto setDefaultAddress(Address param) {
		Account account = SecurityContext.getUserPrincipal();
		Address defaultAddress = this
				.getOne(new QueryWrapper<Address>().eq("account_id", account.getId()).eq("is_default", 1));
		if (defaultAddress != null && defaultAddress.getId() != param.getId()) {
			defaultAddress.setIsDefault(0);
			this.saveOrUpdate(defaultAddress);
		} 
		Address address = this.getOne(new QueryWrapper<Address>().eq("id", param.getId()));
		address.setIsDefault(1);
		this.saveOrUpdate(address);
		return new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
	}

	@Override
	public PageUtils queryPage(Map<String, Object> param) {
		Account account = SecurityContext.getUserPrincipal();
		IPage<Address> page = this.page(new Query<Address>().getPage(param),
				new QueryWrapper<Address>().like("account_id", account.getId()));
		return new PageUtils(page);
	}

}
