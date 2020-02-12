package com.yunjian.core.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

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
@TableName("tb_address")
public class Address implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 用户id
	 */
	private Integer accountId;

	/**
	 * 收件人名称
	 */
	private String userName;

	/**
	 * 收件人联系方式
	 */
	private String phone;

	private Integer provinceId;

	private String provinceName;

	private Integer cityId;

	private String cityName;

	private Integer districtId;

	private String districtName;

	/**
	 * 收件人详细地址
	 */
	private String address;

	/**
	 * 是否默认地址
	 */
	private Integer isDefault;

	private Date createTime;

	private Date updateTime;

	private Integer deleteFlag;

}
