package com.yunjian.core.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.core.entity.PurchaseDetail;
import com.yunjian.core.mapper.PurchaseDetailMapper;
import com.yunjian.core.service.IPurchaseDetailService;
import com.yunjian.core.vo.PurchaseDetailVo;

/**
 * <p>
 * 采购订单详情表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@Service
public class PurchaseDetailServiceImpl extends ServiceImpl<PurchaseDetailMapper, PurchaseDetail> implements IPurchaseDetailService {

	@Resource
	private PurchaseDetailMapper purchaseDetailMapper;
	
	@Override
	public List<PurchaseDetailVo> queryPurchaseDetailInfo(String orderNo) {
		List<PurchaseDetailVo> list = purchaseDetailMapper.queryPurchaseDetailList(orderNo);
		return list;
	}

}
