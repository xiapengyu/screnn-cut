package com.yunjian.core.vo;

import com.yunjian.core.entity.Goods;
import com.yunjian.core.entity.GoodsType;
import com.yunjian.core.entity.PurchaseDetail;

public class PurchaseDetailVo extends PurchaseDetail{
	
	private static final long serialVersionUID = 1L;

	private Goods goods;
	
	private GoodsType gosType;
	
	private double totalPrice;

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public GoodsType getGosType() {
		return gosType;
	}

	public void setGosType(GoodsType gosType) {
		this.gosType = gosType;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
