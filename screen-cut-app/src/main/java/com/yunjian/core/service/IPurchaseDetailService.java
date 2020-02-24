package com.yunjian.core.service;

import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.PurchaseDetail;

/**
 * <p>
 * 采购订单详情表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
public interface IPurchaseDetailService extends IService<PurchaseDetail> {

	R queryPurchaseDetailInfo(String orderNo);

}
