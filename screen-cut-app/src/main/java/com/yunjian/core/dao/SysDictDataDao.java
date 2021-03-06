

package com.yunjian.core.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yunjian.core.entity.SysDictDataEntity;

import org.apache.ibatis.annotations.Mapper;

/**
 * 系统配置信息
 * 
 * @author chenshun
 *
 * @date 2016年12月4日 下午6:46:16
 */
@Mapper
public interface SysDictDataDao extends BaseMapper<SysDictDataEntity> {

	void sysDictDataDao(String language);
	
}
