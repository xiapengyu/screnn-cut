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
     * 用户id
     */
    private Integer accountId;
    
    private Integer accountType;

    private Integer address_id;
    
    private Integer status;
    
    private String comment;

    private Date createTime;

    private Date updateTime;

    private Integer deleteFlag;


    
}
