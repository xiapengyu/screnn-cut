package com.yunjian.core.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.PurchaseDetail;
import com.yunjian.core.mapper.PurchaseDetailMapper;
import com.yunjian.core.mapper.PurchaseOrderMapper;
import com.yunjian.core.service.IPurchaseDetailService;
import com.yunjian.core.vo.PurchaseDetailVo;
import com.yunjian.core.vo.PurchaseOrderVo;

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
	
	@Resource
    private PurchaseOrderMapper purchaseOrderMapper;
	
	@Override
	public R queryPurchaseDetailInfo(Map<String, Object> params) {		
		PurchaseOrderVo orderVo = null;
		orderVo = purchaseOrderMapper.queryPurchaseOrderOfAppuser(params);
    	R r = R.ok();
    	List<PurchaseDetailVo> detailList = purchaseDetailMapper.queryPurchaseDetailList(orderVo.getOrderNo());
    	double allTotalPrice = 0;
    	for(PurchaseDetailVo vo : detailList) {
    		double totalPrice = vo.getAmount() * vo.getGoods().getDiscountPrice().doubleValue();
    		vo.setTotalPrice(totalPrice);
    		allTotalPrice += totalPrice;
    	}
    	
    	BigDecimal bg = new BigDecimal(allTotalPrice);
    	allTotalPrice = bg.setScale(2, BigDecimal.ROUND_CEILING).doubleValue();
    	
    	r.put("order", orderVo);
    	r.put("detailList", detailList);
    	r.put("allTotalPrice", allTotalPrice);
		return r;
	}

}
