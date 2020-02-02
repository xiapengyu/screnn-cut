package com.yunjian.core.service.impl;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.Query;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.PushMsg;
import com.yunjian.core.mapper.PushMsgMapper;
import com.yunjian.core.service.IPushMsgService;

/**
 * <p>
 * 推送消息管理表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
@Service
public class PushMsgServiceImpl extends ServiceImpl<PushMsgMapper, PushMsg> implements IPushMsgService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		String title = (String) params.get("title");
		String content = (String) params.get("content");

		QueryWrapper<PushMsg> queryWrapper = new QueryWrapper<PushMsg>();
		queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
		if (StringUtils.isNotBlank(title)) {
			queryWrapper.like("title", title);
		}
		if (StringUtils.isNotBlank(content)) {
			queryWrapper.like("content", content);
		}

		IPage<PushMsg> page = this.page(new Query<PushMsg>().getPage(params), queryWrapper);
		return new PageUtils(page);
	}

	@Override
	public R savePushMsg(Map<String, Object> params) {
		String id = StringUtil.obj2String(params.get("id"));
		try {
			PushMsg msg = null;
			if (StringUtils.isEmpty(id)) { // 新增
				msg = new PushMsg();
				msg.setCreateTime(new Date());
				msg.setPushTime(null);
				msg.setDeleteFlag(1);
			} else { // 修改
				msg = this.getOne(new QueryWrapper<PushMsg>().eq("id", id));
			}
			msg.setTitle(StringUtil.obj2String(params.get("title")));
			msg.setContent(StringUtil.obj2String(params.get("content")));
			msg.setUpdateTime(new Date());
			this.saveOrUpdate(msg);
		} catch (Exception e) {
			logger.error("保存推送信息失败", e);
			return R.error("保存推送信息失败");
		}
		return R.ok();
	}

}
