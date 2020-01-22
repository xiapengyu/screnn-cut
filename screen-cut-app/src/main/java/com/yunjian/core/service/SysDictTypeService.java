

package com.yunjian.core.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.core.entity.SysDictTypeEntity;

import java.util.Map;

/**
 * 系统字典信息
 * @author xiexiangrui
 */
public interface SysDictTypeService extends IService<SysDictTypeEntity> {

	public PageUtils queryPage(Map<String, Object> params);
}
