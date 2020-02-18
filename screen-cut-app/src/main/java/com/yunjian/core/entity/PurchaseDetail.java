package com.yunjian.core.entity;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 采购订单详情表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_purchase_detail")
public class PurchaseDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 采购单编号
     */
    private String orderNo;

    /**
     * 商品id
     */
    private Integer goodsId;

    /**
     * 数量
     */
    private Integer amount;

    /**
     * 单价
     */
    private BigDecimal unitPrice;

    /**
     * 总价
     */
    private BigDecimal price;


}
