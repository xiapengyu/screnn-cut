package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.Distributor;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 经销商信息表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-05
 */
public interface IDistributorService extends IService<Distributor> {

	PageUtils queryPage(Map<String, Object> params);

	R delete(String id);

	R saveDistributorInfo(Map<String, Object> params);

    R saveBatchRecord(List<Distributor> resultList);

}
