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
 * 切割参数设置表
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_setting")
public class Setting implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 参数名称
     */
    private String name;

    /**
     * 切割速度
     */
    private Integer speed;

    /**
     * 下刀压力
     */
    private Integer pressure;

    /**
     * 是否使用中
     */
    private Integer isUse;

    private Integer accountId;

    private Date createTime;

    private Date updateTime;

}
