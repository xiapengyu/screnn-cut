package com.yunjian.core.dto;

import com.yunjian.core.entity.Address;
import com.yunjian.core.entity.PurchaseOrder;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class OrderRespDto extends PurchaseOrder {
    private List<GoodsCartInfo> goodsList = new ArrayList<>();
}
