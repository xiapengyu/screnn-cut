package com.yunjian.core.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * APP用户账户表
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_account")
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 密码
     */
    private String password;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 机器序列码
     */
    private String serialNo;

    /**
     * 机型ID
     */
    private Integer phoneModelId;

    /**
     * 机型名称
     */
    private String phoneModelName;

    /**
     * 状态 1启用 0禁用
     */
    private Integer status;

    /**
     * 注册时间
     */
    private Date createTime;

    private Date updateTime;

    private String userName;

    private String phone;

    /**
     * 删除标记
     */
    private Integer deleteFlag;

    private Integer dealerId;

    private Integer type;

    private Integer remainTimes;

    private Integer useTimes;

}
