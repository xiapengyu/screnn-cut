package com.yunjian.core.dto;

import com.yunjian.core.entity.Goods;
import lombok.Data;

@Data
public class GoodsDto extends Goods {
    private String coverImg;
}
