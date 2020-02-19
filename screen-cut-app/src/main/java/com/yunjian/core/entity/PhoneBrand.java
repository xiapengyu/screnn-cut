package com.yunjian.core.entity;

import com.baomidou.mybatisplus.annotation.TableName;

import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_phone_brand")
public class PhoneBrand implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 品牌名称
     */
    private String brandName;

    /**
     * 品牌图标
     */
    private String brandImg;

    private Date createTime;

    private Date updateTime;

    private Integer deleteFlag;


}
