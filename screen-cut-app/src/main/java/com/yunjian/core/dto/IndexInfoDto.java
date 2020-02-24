package com.yunjian.core.dto;

import java.util.ArrayList;
import java.util.List;

public class IndexInfoDto {

    private List<String> adList = new ArrayList<>();

    private Integer accountType;

    private Integer useAmount = 0;

    private Integer unUseAmount = 0;

	public List<String> getAdList() {
		return adList;
	}

	public void setAdList(List<String> adList) {
		this.adList = adList;
	}

	public Integer getAccountType() {
		return accountType;
	}

	public void setAccountType(Integer accountType) {
		this.accountType = accountType;
	}

	public Integer getUseAmount() {
		return useAmount;
	}

	public void setUseAmount(Integer useAmount) {
		this.useAmount = useAmount;
	}

	public Integer getUnUseAmount() {
		return unUseAmount;
	}

	public void setUnUseAmount(Integer unUseAmount) {
		this.unUseAmount = unUseAmount;
	}

}
