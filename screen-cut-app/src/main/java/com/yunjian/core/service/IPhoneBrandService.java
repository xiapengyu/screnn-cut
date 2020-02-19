package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.PhoneBrand;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-19
 */
public interface IPhoneBrandService extends IService<PhoneBrand> {

    PageUtils queryPage(Map<String, Object> params);

    R savePhoneBrandInfo(Map<String, Object> params);

}
