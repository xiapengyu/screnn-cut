package com.yunjian.core.mapper;

import com.yunjian.core.entity.PushRecord;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 消息推送记录表 Mapper 接口
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
@Mapper
public interface PushRecordMapper extends BaseMapper<PushRecord> {

}
