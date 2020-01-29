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
 * @since 2020-01-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_ad_position")
public class AdPosition implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 广告位名称
     */
    private String name;

    /**
     * 广告位状态 0禁用 1启用
     */
    private Integer status;

    /**
     * 广告位类型
     */
    private Integer positionType;

    private Date createTime;

    private Date updateTime;

    /**
     * 逻辑删除标记 1未删除 0已删除
     */
    private Integer deleteFlag;


}
