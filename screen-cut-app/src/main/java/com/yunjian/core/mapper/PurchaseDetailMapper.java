package com.yunjian.core.mapper;

import com.yunjian.core.entity.PurchaseDetail;
import com.yunjian.core.vo.PurchaseDetailVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
	
	public List<PurchaseDetailVo> queryListurchaseDetail(Integer orderNo);

}
