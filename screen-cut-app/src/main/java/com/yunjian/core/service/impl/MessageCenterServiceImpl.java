package com.yunjian.core.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.MessageCenter;
import com.yunjian.core.mapper.MessageCenterMapper;
import com.yunjian.core.service.IMessageCenterService;

/**
 * <p>
 * 用户消息表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
@Service
public class MessageCenterServiceImpl extends ServiceImpl<MessageCenterMapper, MessageCenter> implements IMessageCenterService {

	@Override
	public AppPageUtils queryPage(Map<String, Object> param) {
		Account account = SecurityContext.getUserPrincipal();
		IPage<MessageCenter> page = this.page(new AppQuery<MessageCenter>().getPage(param),
				new QueryWrapper<MessageCenter>().like("account_id", account.getId()));
		return new AppPageUtils(page);
	}

}
