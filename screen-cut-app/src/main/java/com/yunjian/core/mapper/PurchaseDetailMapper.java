package com.yunjian.core.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yunjian.core.entity.PurchaseDetail;
import com.yunjian.core.vo.PurchaseDetailVo;

/**
 * <p>
 * 采购订单详情表 Mapper 接口
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@Mapper
public interface PurchaseDetailMapper extends BaseMapper<PurchaseDetail> {
	List<PurchaseDetailVo> queryPurchaseDetailList(String orderNo);
}
