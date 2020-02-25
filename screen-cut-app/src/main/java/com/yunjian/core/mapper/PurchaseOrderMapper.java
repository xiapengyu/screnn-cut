package com.yunjian.core.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yunjian.core.entity.PurchaseOrder;
import com.yunjian.core.vo.PurchaseOrderVo;

/**
 * <p>
 * 采购订单信息表 Mapper 接口
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@Mapper
public interface PurchaseOrderMapper extends BaseMapper<PurchaseOrder> {
	
	IPage<PurchaseOrderVo> selectPageVo(Page<PurchaseOrderVo> page, Map<String,Object> map);

}
