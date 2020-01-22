

package com.yunjian.core.service;

import java.util.Set;

import com.yunjian.core.entity.SysUserEntity;
import com.yunjian.core.entity.SysUserTokenEntity;

/**
 * shiro相关接口
 *
 *
 */
public interface ShiroService {
    /**
     * 获取用户权限列表
     */
    Set<String> getUserPermissions(long userId);

    SysUserTokenEntity queryByToken(String token);

    /**
     * 根据用户ID，查询用户
     * @param userId
     */
    SysUserEntity queryUser(Long userId);
}
