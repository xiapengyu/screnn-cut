package com.yunjian.core.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yunjian.core.entity.MessageCenter;

/**
 * <p>
 * 用户消息表 Mapper 接口
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
@Mapper
public interface MessageCenterMapper extends BaseMapper<MessageCenter> {

}
