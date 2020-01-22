package com.yunjian.core.mapper;

import com.yunjian.core.entity.Account;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * APP用户账户表 Mapper 接口
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-21
 */
@Mapper
public interface AccountMapper extends BaseMapper<Account> {

}
