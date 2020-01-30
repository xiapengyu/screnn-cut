package com.yunjian.core.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 消息推送记录表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_push_record")
public class PushRecord implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 推送消息id
	 */
	private Integer msgId;

	/**
	 * 接收推送消息的用户
	 */
	private Integer accountId;

}
