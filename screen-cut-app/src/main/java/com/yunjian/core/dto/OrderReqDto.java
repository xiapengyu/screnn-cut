package com.yunjian.core.dto;

import com.yunjian.core.entity.GoodsCart;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class OrderReqDto {

    private List<GoodsCart> goodsList = new ArrayList<>();

    private String comment = "";

    private Integer addressId;

}
