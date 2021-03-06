package com.yunjian.core.service.impl;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.Query;
import com.yunjian.core.entity.DealerOrder;
import com.yunjian.core.mapper.DealerOrderMapper;
import com.yunjian.core.service.IDealerOrderService;

/**
 * <p>
 * 经销商采购列表 服务实现类
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-26
 */
@Service
public class DealerOrderServiceImpl extends ServiceImpl<DealerOrderMapper, DealerOrder> implements IDealerOrderService {

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		String orderNo = (String)params.get("orderNo");
        String email = (String)params.get("email");
        Long dealerId = (Long)params.get("dealerId");

        IPage<DealerOrder> page = this.page(
                new Query<DealerOrder>().getPage(params),
                new QueryWrapper<DealerOrder>()
                        .eq(StringUtils.isNotBlank(orderNo),"order_no", orderNo)
                        .eq(dealerId!=null && dealerId!=0,"dealer_id", dealerId)
                        .like(StringUtils.isNotBlank(email),"dealer_email", email)
        );
        return new PageUtils(page);
	}

}
