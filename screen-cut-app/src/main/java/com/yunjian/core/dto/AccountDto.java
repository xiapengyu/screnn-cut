package com.yunjian.core.dto;

import com.yunjian.core.entity.Account;

public class AccountDto extends Account {

	private static final long serialVersionUID = 1L;
	
	private String code;
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
