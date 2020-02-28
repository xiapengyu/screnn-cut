package com.yunjian.core.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.core.dto.ResponseDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.MessageCenter;
import com.yunjian.core.mapper.MessageCenterMapper;
import com.yunjian.core.service.IMessageCenterService;
import com.yunjian.common.utils.*;

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

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public PageUtils queryPage(Map<String, Object> param) {
		Account account = SecurityContext.getUserPrincipal();
		IPage<MessageCenter> page = this.page(new Query<MessageCenter>().getPage(param),
				new QueryWrapper<MessageCenter>().like("account_id", account.getId()));
		return new PageUtils(page);
	}

	@Override
	public void saveMessage(MessageCenter msg) {
		logger.info("保存用户信息{}", msg);
		Account account = SecurityContext.getUserPrincipal();
		msg.setIsRead(1);
		msg.setAccountId(account.getId());
		msg.setCreateTime(new Date());
		msg.setDeleteFlag(1);
		msg.setUpdateTime(new Date());
		msg.setCreatorId(0L);
		this.save(msg);
	}

	@Override
	public ResponseDto deleteMsg(List<Integer> idList) {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		try {
			this.remove(new QueryWrapper<MessageCenter>().in("id", idList));
			return response;
		} catch (Exception e) {
			logger.error("删除用户信息失败", e);
			return new ResponseDto(Constant.FAIL_CODE, null, "删除用户信息失败");
		}
	}

}
