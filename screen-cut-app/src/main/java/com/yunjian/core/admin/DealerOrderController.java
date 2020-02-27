package com.yunjian.core.admin;


import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yunjian.common.annotation.SysLog;
import com.yunjian.common.utils.BusinessUtils;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.entity.DealerOrder;
import com.yunjian.core.service.IDealerOrderService;

import lombok.extern.slf4j.Slf4j;

/**
 * <p>
 * 经销商采购列表 前端控制器
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-26
 */
@Slf4j
@RestController
@RequestMapping("/sys/dealerPurchase")
public class DealerOrderController {
	
	@Autowired
	private IDealerOrderService dealerOrderService;
	
	/**
	 * 分页查询采购单列表
	 */
	@PostMapping("/list")
	public R queryOrderByPage(@RequestBody Map<String, Object> params) {
		int dealerId = 3;
		params.put("dealerId", dealerId);
		PageUtils page = dealerOrderService.queryPage(params);
		return R.ok().put("page", page);
	}
	
	/**
	 * 保存配置
	 */
	@SysLog("保存字典")
	@PostMapping("/save")
	public R save(@RequestBody DealerOrder dealerOrder){
		if(dealerOrder.getId()==null) {
			int dealerId = 3;
			dealerOrder.setDealerId(dealerId);
			dealerOrder.setOrderNo(BusinessUtils.createOrderNo());
		}
		dealerOrderService.saveOrUpdate(dealerOrder);
		return R.ok();
	}
	
	/**
	 * 订单信息
	 */
	@GetMapping("/info/{id}")
	public R info(@PathVariable("id") Long id){
		DealerOrder order = dealerOrderService.getById(id);
		return R.ok().put("order", order);
	}
	
	/**
	 * 确认或者拒绝订单订单信息
	 */
	@PostMapping("/confirm")
	public R confirm(@RequestBody Map<String, Object> params){
		DealerOrder order = new DealerOrder();
		order.setId((Integer)params.get("id"));
		order.setStatus((Integer)params.get("status"));
		order.setComment((String)params.get("comment"));
		dealerOrderService.updateById(order);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@SysLog("删除经销商采购单")
	@PostMapping("/delete")
	public R delete(@RequestBody Long[] ids){
		dealerOrderService.removeByIds(Arrays.asList(ids));

		return R.ok();
	}

}
