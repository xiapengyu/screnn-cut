package com.yunjian.core.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 设备信息表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_device")
public class Device implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 机器序列号
     */
    private String serialNo;

    /**
     * 类型 1不限次数 2有限次数
     */
    private Integer type;

    /**
     * 经销商id
     */
    private Long creatorId;

    /**
     * 经销商名称
     */
    private String creatorName;

    /**
     * 状态 1正常 0禁用
     */
    private Integer status;

    /**
     * 购买时间
     */
    private Date buyTime;

    /**
     * 绑定邮箱
     */
    private String email;

    /**
     * 剩余次数
     */
    private Integer remainTimes;

    private Date createTime;

    private Date updateTime;

    private Integer deleteFlag;

    private String deviceName;

    private Integer useTimes;

}
