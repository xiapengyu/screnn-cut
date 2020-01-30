package com.yunjian.core.service.impl;

import com.yunjian.core.entity.PushRecord;
import com.yunjian.core.mapper.PushRecordMapper;
import com.yunjian.core.service.IPushRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 消息推送记录表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
@Service
public class PushRecordServiceImpl extends ServiceImpl<PushRecordMapper, PushRecord> implements IPushRecordService {

}
