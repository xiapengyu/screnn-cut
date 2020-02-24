package com.yunjian.core.dto;

import java.math.BigDecimal;

import lombok.Data;

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
