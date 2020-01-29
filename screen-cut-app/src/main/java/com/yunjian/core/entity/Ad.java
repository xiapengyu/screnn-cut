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
@TableName("tb_ad")
public class Ad implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 广告图
     */
    private String adImage;

    /**
     * 广告展示的广告位置
     */
    private Integer positionId;

    /**
     * 广告位名称
     */
    private String positionName;

    /**
     * 广告位排序
     */
    private Integer sortNum;

    /**
     * 状态 1启用 0禁用
     */
    private Integer status;

    private Date createTime;

    private Date updateTime;

    /**
     * 逻辑删除标记 1未删除 0已删除
     */
    private Integer deleteFlag;


}
