package com.yunjian.core.service.impl;

import java.awt.image.BufferedImage;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.code.kaptcha.Producer;
import com.yunjian.common.exception.RRException;
import com.yunjian.common.utils.DateUtils;
import com.yunjian.core.dao.SysCaptchaDao;
import com.yunjian.core.entity.SysCaptchaEntity;
import com.yunjian.core.service.SysCaptchaService;

/**
 * 验证码
 *
 *
 */
@Service("sysCaptchaService")
public class SysCaptchaServiceImpl extends ServiceImpl<SysCaptchaDao, SysCaptchaEntity> implements SysCaptchaService {
	@Autowired
	private Producer producer;

	@Override
	public BufferedImage getCaptcha(String uuid) {
		if (StringUtils.isBlank(uuid)) {
			throw new RRException("uuid不能为空");
		}
		// 生成文字验证码
		String code = producer.createText();

		SysCaptchaEntity captchaEntity = new SysCaptchaEntity();
		captchaEntity.setUuid(uuid);
		captchaEntity.setCode(code);
		// 5分钟后过期
		captchaEntity.setExpireTime(DateUtils.addDateMinutes(new Date(), 5));
		this.save(captchaEntity);

		return producer.createImage(code);
	}

	@Override
	public boolean validate(String uuid, String code) {
		SysCaptchaEntity captchaEntity = this.getOne(new QueryWrapper<SysCaptchaEntity>().eq("uuid", uuid));
		if (captchaEntity == null) {
			return false;
		}

		// 删除验证码
		this.removeById(uuid);

		if (captchaEntity.getCode().equalsIgnoreCase(code)
				&& captchaEntity.getExpireTime().getTime() >= System.currentTimeMillis()) {
			return true;
		}

		return false;
	}
}
