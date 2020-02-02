package com.yunjian.core.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 商品图片表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_goods_img")
public class GoodsImg implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 商品id
	 */
	private Integer goodsId;

	/**
	 * 图片URL
	 */
	private String imageUrl;

	private Date createTime;

	private Date updateTime;

	/**
	 * 逻辑删除标志
	 */
	private Integer deleteFlag;

}
