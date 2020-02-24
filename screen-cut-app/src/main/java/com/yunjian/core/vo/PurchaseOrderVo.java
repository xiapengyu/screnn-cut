package com.yunjian.core.vo;

import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.Goods;
import com.yunjian.core.entity.GoodsType;
import com.yunjian.core.entity.PurchaseDetail;
import com.yunjian.core.entity.PurchaseOrder;

import lombok.Data;

@Data
public class PurchaseOrderVo extends PurchaseOrder{
	
	private String userEmail;
	
}
