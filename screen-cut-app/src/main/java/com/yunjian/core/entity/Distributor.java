package com.yunjian.core.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 经销商信息表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_distributor")
public class Distributor implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 经销商名称
	 */
	private String name;

	/**
	 * 经销商地址
	 */
	private String address;

	/**
	 * 经销商联系人
	 */
	private String contact;

	/**
	 * 经销商联系方式
	 */
	private String phone;

	/**
	 * 经销商邮箱
	 */
	private String email;

	/**
	 * 经销商标识
	 */
	private String identifier;

	/**
	 * 状态 1正常 0禁用
	 */
	private Integer status;

	private Date createTime;

	private Date updateTime;

	private Integer deleteFlag;

}
