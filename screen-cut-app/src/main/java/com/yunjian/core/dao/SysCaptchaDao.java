

package com.yunjian.core.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yunjian.core.entity.SysCaptchaEntity;

import org.apache.ibatis.annotations.Mapper;

/**
 * 验证码
 *
 *
 */
@Mapper
public interface SysCaptchaDao extends BaseMapper<SysCaptchaEntity> {

}
