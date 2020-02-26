package com.yunjian.core.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 用户兑换记录表
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_redeem_record")
public class RedeemRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 兑换单编码
     */
    private String redeemNo;

    /**
     * 兑换用户
     */
    private Integer accountId;

    /**
     * 兑换时间
     */
    private Date createTime;

}
