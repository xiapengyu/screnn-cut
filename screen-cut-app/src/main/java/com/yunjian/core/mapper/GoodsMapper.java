package com.yunjian.core.mapper;

import com.yunjian.core.entity.Goods;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 商品信息表 Mapper 接口
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-02
 */
@Mapper
public interface GoodsMapper extends BaseMapper<Goods> {

}
