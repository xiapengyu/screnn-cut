package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.PushMsg;

import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 推送消息管理表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
public interface IPushMsgService extends IService<PushMsg> {

	PageUtils queryPage(Map<String, Object> params);

	R savePushMsg(Map<String, Object> params);

}
