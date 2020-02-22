package com.yunjian.core.dto;

import com.yunjian.core.entity.Address;
import lombok.Data;

import java.util.List;

@Data
public class GoodsCartDto {

    private List<GoodsCartInfo> goodsList;

    private Address address;

}