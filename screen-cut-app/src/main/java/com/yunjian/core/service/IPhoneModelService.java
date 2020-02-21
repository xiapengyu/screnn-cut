package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.PhoneModel;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 手机机型信息表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
public interface IPhoneModelService extends IService<PhoneModel> {

    PageUtils queryPage(Map<String, Object> params);

    R savePhoneModelInfo(Map<String, Object> params);

    PageUtils queryAppPage(Map<String, Object> param);

}
