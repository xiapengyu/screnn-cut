package com.yunjian.core.dto;

import com.yunjian.core.entity.Account;

public class AccountDto extends Account {

	private static final long serialVersionUID = 1L;
	
	private String code;

	private Integer remainTimes;

	private Integer useTimes;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getRemainTimes() {
		return remainTimes;
	}

	public void setRemainTimes(Integer remainTimes) {
		this.remainTimes = remainTimes;
	}

	public Integer getUseTimes() {
		return useTimes;
	}

	public void setUseTimes(Integer useTimes) {
		this.useTimes = useTimes;
	}
}
