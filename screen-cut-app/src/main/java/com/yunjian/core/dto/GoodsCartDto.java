package com.yunjian.core.dto;

import com.yunjian.core.entity.Address;
import lombok.Data;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data
public class GoodsCartDto {

    private List<GoodsCartInfo> goodsList = new ArrayList<>();

    private Address address;

}
