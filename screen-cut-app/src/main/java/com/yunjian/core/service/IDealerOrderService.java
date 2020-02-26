package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.core.entity.DealerOrder;

import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 经销商采购列表 服务类
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-26
 */
public interface IDealerOrderService extends IService<DealerOrder> {

	PageUtils queryPage(Map<String, Object> params);

}
