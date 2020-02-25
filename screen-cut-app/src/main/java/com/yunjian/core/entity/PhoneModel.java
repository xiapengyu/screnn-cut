package com.yunjian.core.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 手机机型信息表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_phone_model")
public class PhoneModel implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 手机图片
     */
    private String phoneImage;

    /**
     * 手机品牌
     */
    private String phoneBrand;

    /**
     * 手机型号
     */
    private String phoneModel;

    /**
     * 排序码
     */
    private Integer sortNum;

    /**
     * 状态 1正常 0禁用
     */
    private Integer status;

    private Date createTime;

    private Date updateTime;

    private Integer deleteFlag;

    private Integer width;

    private Integer height;

    private Integer brandId;

    private String pltUrl;

    private String originName;

    private Integer type;

}
