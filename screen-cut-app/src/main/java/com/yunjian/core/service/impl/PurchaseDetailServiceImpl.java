package com.yunjian.core.service.impl;

import com.yunjian.core.entity.PurchaseDetail;
import com.yunjian.core.mapper.PurchaseDetailMapper;
import com.yunjian.core.service.IPurchaseDetailService;
import com.yunjian.core.vo.PurchaseDetailVo;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

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

	@Override
	public List<PurchaseDetailVo> queryPurchaseDetailInfo(String orderNo) {
		return this.queryPurchaseDetailInfo(orderNo);
	}

}
