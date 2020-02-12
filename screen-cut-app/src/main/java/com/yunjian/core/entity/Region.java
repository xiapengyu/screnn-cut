package com.yunjian.core.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_region")
public class Region implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 行政区域名称
	 */
	private String name;

	/**
	 * 上级行政区域id
	 */
	private String parentId;

	/**
	 * 简称
	 */
	private String shortName;

	/**
	 * 级别2省份3市区4区县
	 */
	private Integer levelType;

	private String cityCode;

	/**
	 * 邮编
	 */
	private String zipCode;

	private String mergeName;

	private String pinyin;

	/**
	 * 经度
	 */
	private String lng;

	/**
	 * 纬度
	 */
	private String lat;

}
