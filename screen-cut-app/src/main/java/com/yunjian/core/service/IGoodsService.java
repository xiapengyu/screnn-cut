package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.Goods;

import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 商品信息表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-02
 */
public interface IGoodsService extends IService<Goods> {

	PageUtils queryPage(Map<String, Object> params);

	R saveGoods(Map<String, Object> params);

	R newGoods(Map<String, Object> params);

}
