package com.yunjian.core.dto;

import com.yunjian.core.entity.Address;
import com.yunjian.core.entity.PurchaseOrder;
import lombok.Data;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data
public class OrderRespDto extends PurchaseOrder {

    private BigDecimal totalPrice;

    private List<GoodsCartInfo> goodsList = new ArrayList<>();

}
