package com.yunjian.core.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.Constant;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Address;
import com.yunjian.core.entity.Region;
import com.yunjian.core.mapper.RegionMapper;
import com.yunjian.core.service.IRegionService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
@Service
public class RegionServiceImpl extends ServiceImpl<RegionMapper, Region> implements IRegionService {

	@Override
	public ResponseDto queryProvinceList() {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		QueryWrapper<Region> query = new QueryWrapper<Region>();
		query.eq("level_type", 2);
		response.setData(this.list(query));
		return response;
	}

	@Override
	public ResponseDto queryCityList(Address param) {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		QueryWrapper<Region> query = new QueryWrapper<Region>();
		query.eq("level_type", 3);
		query.eq("parent_id",param.getId());
		response.setData(this.list(query));
		return response;
	}

	@Override
	public ResponseDto queryDistributeList(Address param) {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		QueryWrapper<Region> query = new QueryWrapper<Region>();
		query.eq("level_type", 4);
		query.eq("parent_id", param.getId());
		response.setData(this.list(query));
		return response;
	}

}
