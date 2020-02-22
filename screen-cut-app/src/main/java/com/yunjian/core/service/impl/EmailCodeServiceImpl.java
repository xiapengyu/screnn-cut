package com.yunjian.core.service.impl;

import java.util.Date;

import com.yunjian.common.utils.MailUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.Constant;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.EmailCode;
import com.yunjian.core.mapper.EmailCodeMapper;
import com.yunjian.core.service.IEmailCodeService;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-21
 */
@Service
public class EmailCodeServiceImpl extends ServiceImpl<EmailCodeMapper, EmailCode> implements IEmailCodeService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public ResponseDto sendEmailCode(Account param) {
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		try {
			// 生成六位随机数字
			//String code = (int) ((Math.random() * 9 + 1) * 100000) + "";
			String code = "123456";
			
			//删除旧的验证码
			this.remove(new QueryWrapper<EmailCode>().eq("email", param.getEmail()));
			//保存新的验证码
			Date now = new Date();
			EmailCode record = new EmailCode();
			record.setCode(code);
			record.setEmail(param.getEmail());
			record.setExpireTime(new Date(now.getTime() + Constant.CODE_EXPIRE_TIME));
			record.setUpdateTime(now);
			record.setDeleteFlag(1);
			this.save(record);
			//发送邮件
			logger.info("发送邮件:收件人[{}],验证码[{}]", param.getEmail(), code);
			MailUtils.sendMail(param.getEmail(), code);
		} catch (Exception e) {
			logger.error("发送邮件报错", e);
			return new ResponseDto(Constant.FAIL_CODE, null, "发送邮件报错失败");
		}
		return response;
	}
	
}
