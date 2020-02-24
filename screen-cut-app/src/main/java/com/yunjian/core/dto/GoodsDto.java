package com.yunjian.core.dto;

import com.yunjian.core.entity.Goods;

public class GoodsDto extends Goods {
	
	private static final long serialVersionUID = 1L;
	
	private String coverImg;

	public String getCoverImg() {
		return coverImg;
	}

	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
