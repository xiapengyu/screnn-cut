package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.dto.OrderReqDto;
import com.yunjian.core.dto.OrderRespDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.PurchaseOrder;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 采购订单信息表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
public interface IPurchaseOrderService extends IService<PurchaseOrder> {

    ResponseDto submitCart(OrderReqDto param);

    PageUtils queryOrderByPage(Map<String, Object> params);

    ResponseDto queryOrderDetail(String orderNo);

    PageUtils queryAccountOrderList(Map<String, Object> params);

    OrderRespDto queryOrderInfo(String orderNo);

}
