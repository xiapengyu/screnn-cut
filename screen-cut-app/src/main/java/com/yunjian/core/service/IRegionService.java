package com.yunjian.core.service;

import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Address;
import com.yunjian.core.entity.Region;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
public interface IRegionService extends IService<Region> {

	ResponseDto queryProvinceList();

	ResponseDto queryCityList(Address param);

	ResponseDto queryDistributeList(Address param);

}
