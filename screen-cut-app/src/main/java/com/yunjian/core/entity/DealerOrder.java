package com.yunjian.core.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 经销商采购列表
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_dealer_order")
public class DealerOrder implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;

	/**
	 * 采购单号
	 */
	private String orderNo;

	/**
	 * 公司
	 */
	private String company;

	/**
	 * 经销商名称
	 */
	private String dealerName;

	/**
	 * 经销商email
	 */
	private String dealerEmail;

	/**
	 * 其他联系方式
	 */
	private String otherContact;

	/**
	 * 刀片数量
	 */
	private Integer bladeNo;

	/**
	 * 刀片说明
	 */
	private String bladeExplain;

	/**
	 * 膜数量
	 */
	private Integer filmNo;

	/**
	 * 膜说明
	 */
	private String filmExplain;

	/**
	 * 机器数量
	 */
	private Integer deviceNo;

	/**
	 * 机器说明
	 */
	private String deviceExplain;

	/**
	 * 可用次数
	 */
	private Integer useTimes;

	/**
	 * 回复说明
	 */
	private String comment;

	/**
	 * 1未确认，2已确认，3已拒绝
	 */
	private Integer status;
	
	private Date createTime;

}
