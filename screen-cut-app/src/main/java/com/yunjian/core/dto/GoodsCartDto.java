package com.yunjian.core.dto;

import java.util.ArrayList;
import java.util.List;

import com.yunjian.core.entity.Address;

import lombok.Data;

@Data
public class GoodsCartDto {

    private List<GoodsCartInfo> goodsList = new ArrayList<>();

    private Address address;

}
