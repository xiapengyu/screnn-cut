package com.yunjian.core.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 兑换码信息表
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_redeem_code")
public class RedeemCode implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 批次号
     */
    private Integer batchNo;

    /**
     * 兑换码二维码地址
     */
    private String url;

    /**
     * 兑换码二维码内容
     */
    private String content;

    /**
     * 可新增切割次数
     */
    private Integer times;

    /**
     * 状态 0禁用 1启用 2已使用
     */
    private Integer status;

    private Date createTime;

    private Date updateTime;

    private Integer deleteFlag;

    private String redeemNo;

    private Long creatorId;

}
