package com.yunjian.core.service;

import com.yunjian.core.dto.AccountDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Account;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * APP用户账户表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-21
 */
public interface IAccountService extends IService<Account> {

	ResponseDto register(AccountDto param);

	ResponseDto login(Account param);

	ResponseDto logout();

	ResponseDto resetPassword(AccountDto param);

}
