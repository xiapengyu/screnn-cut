package com.yunjian.core.vo;

import com.yunjian.core.entity.PurchaseOrder;

import lombok.Data;

@Data
public class PurchaseOrderVo extends PurchaseOrder{
	
	private String userEmail;
	
	private String userName;
	
	private String phone;
	
	private String address;
	
}
