

package com.yunjian.core.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yunjian.core.entity.SysUserTokenEntity;

import org.apache.ibatis.annotations.Mapper;

/**
 * 系统用户Token
 *
 *
 */
@Mapper
public interface SysUserTokenDao extends BaseMapper<SysUserTokenEntity> {

    SysUserTokenEntity queryByToken(String token);
	
}
