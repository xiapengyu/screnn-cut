package com.yunjian.core.mapper;

import com.yunjian.core.entity.PushMsg;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 推送消息管理表 Mapper 接口
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
@Mapper
public interface PushMsgMapper extends BaseMapper<PushMsg> {

}
