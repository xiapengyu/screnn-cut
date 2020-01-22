package com.yunjian.core.service;

import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.EmailCode;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-21
 */
public interface IEmailCodeService extends IService<EmailCode> {

	ResponseDto sendEmailCode(Account param);

}
