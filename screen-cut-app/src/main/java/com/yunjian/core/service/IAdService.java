package com.yunjian.core.service;

import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.Ad;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
public interface IAdService extends IService<Ad> {

    PageUtils queryPage(Map<String, Object> params);

    R saveAdInfo(Map<String, Object> params);

}
