package com.yunjian.core.entity;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 购物车信息表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_goods_cart")
public class GoodsCart implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 商品名称
     */
    private Integer goodsId;

    /**
     * 商品数量
     */
    private Integer amount;

    /**
     * 总价
     */
    private BigDecimal totalPrice;

    /**
     * 用户id
     */
    private Integer accountId;


}
