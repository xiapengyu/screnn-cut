

package com.yunjian.core.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.core.entity.SysDictDataEntity;

import java.util.Map;

/**
 * 系统配置信息
 * 
 * @author chenshun
 *
 * @date 2016年12月4日 下午6:49:01
 */
public interface SysDictDataService extends IService<SysDictDataEntity> {
    public PageUtils queryPage(Map<String, Object> params);
}
