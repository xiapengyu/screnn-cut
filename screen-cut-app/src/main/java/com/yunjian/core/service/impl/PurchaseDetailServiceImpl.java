package com.yunjian.core.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.PurchaseDetail;
import com.yunjian.core.entity.PurchaseOrder;
import com.yunjian.core.mapper.PurchaseDetailMapper;
import com.yunjian.core.service.IPurchaseDetailService;
import com.yunjian.core.service.IPurchaseOrderService;
import com.yunjian.core.vo.PurchaseDetailVo;

/**
 * <p>
 * 采购订单详情表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@Service
public class PurchaseDetailServiceImpl extends ServiceImpl<PurchaseDetailMapper, PurchaseDetail> implements IPurchaseDetailService {

	@Resource
	private PurchaseDetailMapper purchaseDetailMapper;
	
	@Autowired
    private IPurchaseOrderService purchaseOrderService;
	
	@Override
	public R queryPurchaseDetailInfo(String orderNo) {
		QueryWrapper<PurchaseOrder> queryWrapper = new QueryWrapper<PurchaseOrder>();
    	queryWrapper.eq("order_no", orderNo);
    	List<PurchaseOrder> orderList = purchaseOrderService.list(queryWrapper);
    	R r = R.ok();
    	if(orderList!=null && orderList.size() > 0) {
    		List<PurchaseDetailVo> detailList = purchaseDetailMapper.queryPurchaseDetailList(orderNo);
    		double allTotalPrice = 0;
    		for(PurchaseDetailVo vo : detailList) {
    			double totalPrice = vo.getAmount() * vo.getGoods().getDiscountPrice().doubleValue();
    			vo.setTotalPrice(totalPrice);
    			allTotalPrice += totalPrice;
    		}
    		
    		r.put("order", orderList.get(0));
    		r.put("detailList", detailList);
    		r.put("allTotalPrice", allTotalPrice);
    	}
		return r;
	}

}
