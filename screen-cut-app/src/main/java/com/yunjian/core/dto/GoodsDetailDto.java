package com.yunjian.core.dto;

import java.util.ArrayList;
import java.util.List;

import com.yunjian.core.entity.Goods;
import com.yunjian.core.entity.GoodsType;

public class GoodsDetailDto extends Goods {

	private static final long serialVersionUID = 1L;
	
	private String coverImg = "";

	private List<GoodsType> typeList = new ArrayList<>();

    private List<String> imageList = new ArrayList<>();

	public List<GoodsType> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<GoodsType> typeList) {
		this.typeList = typeList;
	}

	public List<String> getImageList() {
		return imageList;
	}

	public void setImageList(List<String> imageList) {
		this.imageList = imageList;
	}

	public String getCoverImg() {
		return coverImg;
	}

	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}
	
}
