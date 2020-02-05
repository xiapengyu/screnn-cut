package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.Device;

import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 设备信息表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-05
 */
public interface IDeviceService extends IService<Device> {

	PageUtils queryPage(Map<String, Object> params);

	R saveDeviceInfo(Map<String, Object> params);

	R deleteDevice(String id);

}
