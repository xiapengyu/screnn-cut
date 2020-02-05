package com.yunjian.core.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yunjian.core.entity.Distributor;

/**
 * <p>
 * 经销商信息表 Mapper 接口
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-05
 */
@Mapper
public interface DistributorMapper extends BaseMapper<Distributor> {

}
