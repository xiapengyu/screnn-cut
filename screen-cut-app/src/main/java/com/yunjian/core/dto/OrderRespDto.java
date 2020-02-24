package com.yunjian.core.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.yunjian.core.entity.PurchaseOrder;

public class OrderRespDto extends PurchaseOrder {

	private static final long serialVersionUID = 1L;

	private BigDecimal totalPrice;

    private List<GoodsCartInfo> goodsList = new ArrayList<>();

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<GoodsCartInfo> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<GoodsCartInfo> goodsList) {
		this.goodsList = goodsList;
	}
    
}
