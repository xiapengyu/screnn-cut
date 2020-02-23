package com.yunjian.core.service;

import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Setting;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 切割参数设置表 服务类
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-23
 */
public interface ISettingService extends IService<Setting> {

    ResponseDto saveSetting(Setting param);

}
