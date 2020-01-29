package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.AdPosition;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
public interface IAdPositionService extends IService<AdPosition> {

    PageUtils queryPage(Map<String, Object> params);

    R deleteAdPosition(String positionId);

    R adPositionInfoSave(Map<String, Object> params);

}
