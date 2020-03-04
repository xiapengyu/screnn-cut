package com.yunjian.common.thread;

import java.util.Collection;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.JpushDataDto;
import com.yunjian.core.service.JPushService;

public class JpushThread implements Runnable {
	private static final Logger logger = LoggerFactory.getLogger(JpushThread.class);

	private JPushService jPushServiceImpl;
	private Collection<String> alias;// 别名，APP以用户邮箱为别名
	private String title;
	private String subTitle;
	private Map<String, String> data;

	public JpushThread(JPushService jPushServiceImpl, Collection<String> alias, String title,
			String subTitle, Map<String, String> data) {
		super();
		this.jPushServiceImpl = jPushServiceImpl;
		this.alias = alias;
		this.title = title;
		this.subTitle = subTitle;
		this.data = data;
	}

	@Override
	public void run() {
		JpushDataDto jpushData = null;
		try {
			jpushData = new JpushDataDto();
			jpushData.setSource("push");
			jpushData.setTitle(title);
			jpushData.setData(data);
			jpushData.setAlias(alias);
			logger.info("开始极光推送{}", JsonUtil.toJsonString(jpushData));
			jPushServiceImpl.pushByAlias(jpushData);
			logger.info("结束极光推送");
		} catch (Exception e) {
			logger.error("极光推送失败{}", jpushData, e);
		}
	}

	public JPushService getjPushServiceImpl() {
		return jPushServiceImpl;
	}

	public void setjPushServiceImpl(JPushService jPushServiceImpl) {
		this.jPushServiceImpl = jPushServiceImpl;
	}

	public Collection<String> getAlias() {
		return alias;
	}

	public void setAlias(Collection<String> alias) {
		this.alias = alias;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public Map<String, String> getData() {
		return data;
	}

	public void setData(Map<String, String> data) {
		this.data = data;
	}
}
