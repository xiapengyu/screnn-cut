package com.yunjian.core.dto;

import com.yunjian.core.entity.GoodsType;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class GoodsCartInfo {

    private Integer id;

    private String name = "";

    private BigDecimal unitPrice = BigDecimal.ZERO;

    private BigDecimal totalPrice = BigDecimal.ZERO;

    private Integer amount = 0;

    private String coverImg = "";

    private Integer goodsType;

    private String goodsTypeName = "";

}
