package com.yunjian.core.dto;

import com.yunjian.core.entity.Goods;
import com.yunjian.core.entity.GoodsType;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class GoodsDetailDto extends Goods {

    private List<GoodsType> typeList = new ArrayList<>();

    private List<String> imageList = new ArrayList<>();
}
