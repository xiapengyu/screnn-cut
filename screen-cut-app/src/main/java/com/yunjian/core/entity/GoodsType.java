package com.yunjian.core.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 手机膜类型表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_goods_type")
public class GoodsType implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 手机膜类型(钢化膜，磨砂膜等，初始化数据)
	 */
	private String name;

	private Integer deleteFlag;

}
