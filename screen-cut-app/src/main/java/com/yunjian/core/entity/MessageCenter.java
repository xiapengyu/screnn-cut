package com.yunjian.core.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 用户消息表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_message_center")
public class MessageCenter implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 用户id
	 */
	private Integer accountId;

	/**
	 * 标题
	 */
	private String title;

	/**
	 * 内容
	 */
	private String content;

	/**
	 * 已读标记 0未读 1已读
	 */
	private Integer isRead;

	private Date createTime;

	private Date updateTime;

	private Integer deleteFlag;

}
