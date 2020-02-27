package com.yunjian.core.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 商品信息表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_goods")
public class Goods implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 商品名称
	 */
	private String name;

	/**
	 * 商品介绍
	 */
	private String comment;

	/**
	 * 原价
	 */
	private BigDecimal price;

	/**
	 * 是否打折
	 */
	private Integer isDiscount;

	/**
	 * 折扣价
	 */
	private BigDecimal discountPrice;

	/**
	 * 销量
	 */
	private Integer saleAmount;

	/**
	 * 库存
	 */
	private Integer stock;

	/**
	 * 商品类型ID 支持多类型 以逗号分割
	 */
	private String type;

	/**
	 * 状态 1上架 0下架
	 */
	private Integer status;

	private Date createTime;

	private Date updateTime;

	private Integer deleteFlag;

	private Long creatorId;

}
