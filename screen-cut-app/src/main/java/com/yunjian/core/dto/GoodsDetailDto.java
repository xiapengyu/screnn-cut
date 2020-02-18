package com.yunjian.core.dto;

import com.yunjian.core.entity.Goods;
import lombok.Data;

import java.util.List;

@Data
public class GoodsDetailDto extends Goods {
    private List<String> imageList;
}
