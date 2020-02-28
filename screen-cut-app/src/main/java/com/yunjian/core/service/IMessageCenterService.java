package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.MessageCenter;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户消息表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
public interface IMessageCenterService extends IService<MessageCenter> {

    PageUtils queryPage(Map<String, Object> param);

    public void saveMessage(MessageCenter msg);

    ResponseDto deleteMsg(List<Integer> idList);

}
