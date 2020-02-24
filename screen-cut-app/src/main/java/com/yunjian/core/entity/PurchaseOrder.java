package com.yunjian.core.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 采购订单信息表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_purchase_order")
public class PurchaseOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 采购单编号
     */
    private String orderNo;

    /**
     * 备注
     */
    private String comment;

    /**
     * 用户id
     */
    private Integer accountId;
    
    private String company;

    /**
     * 状态，预留字段
     */
    private Integer status;

    private Date createTime;

    private Date updateTime;

    private Integer deleteFlag;

    private String userName;

    private String phone;
    
    private String email;

    private String address;
    
}
