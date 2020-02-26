package com.yunjian.core.vo;

import com.yunjian.core.entity.PurchaseOrder;

public class PurchaseOrderVo extends PurchaseOrder{
	
	private static final long serialVersionUID = 1L;

	private String userEmail;
	
	private String userName;
	
	private String phone;
	
	private String address;

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
