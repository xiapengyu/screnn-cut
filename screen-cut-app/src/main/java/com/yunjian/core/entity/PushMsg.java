package com.yunjian.core.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 推送消息管理表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_push_msg")
public class PushMsg implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 推送消息主体
	 */
	private String title;

	/**
	 * 推送消息内容
	 */
	private String content;

	private Date createTime;

	private Date updateTime;

	/**
	 * 推送时间
	 */
	private Date pushTime;

	/**
	 * 逻辑删除标记
	 */
	private Integer deleteFlag;

}
