package com.yunjian.core.vo;

import com.yunjian.core.entity.Goods;
import com.yunjian.core.entity.GoodsType;
import com.yunjian.core.entity.PurchaseDetail;

import lombok.Data;

@Data
public class PurchaseDetailVo extends PurchaseDetail{
	
	private Goods goods;
	
	private GoodsType gosType;
	
	private double totalPrice;

}
