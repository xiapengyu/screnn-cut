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
 * @since 2020-01-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_account_cache")
public class AccountCache implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;

	private Integer accountId;

	private String token;

	private String accountInfo;

	private Date expireTime;

	private Date updateTime;

}
