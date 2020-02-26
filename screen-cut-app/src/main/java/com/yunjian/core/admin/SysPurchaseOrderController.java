package com.yunjian.core.admin;


import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.service.IPurchaseDetailService;
import com.yunjian.core.service.IPurchaseOrderService;

/**
 * <p>
 * 采购订单信息表 前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@RestController
@RequestMapping("/sys/purchaseOrder")
public class SysPurchaseOrderController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IPurchaseOrderService purchaseOrderService;
	@Autowired
	private IPurchaseDetailService purchaseDetailService;

	/**
	 * 分页查询采购单列表
	 */
	@PostMapping("/list")
	public R queryOrderByPage(@RequestBody Map<String, Object> params) {
		logger.info("分页查询采购单列表{}", JsonUtil.toJsonString(params));
		PageUtils page = purchaseOrderService.queryOrderByPage4Sys(params);
		return R.ok().put("page", page);
	}

	/**
	 * 分页查询采购单列表
	 */
	@PostMapping("/delete")
	public R delete(@RequestBody Map<String, Object> params) {
		int id = (int) params.get("id");
		purchaseOrderService.removeById(id);
		return R.ok();
	}

	/**
	 * 查看采购单详情
	 */
	@PostMapping("/detail")
	public R queryDetail(@RequestBody Map<String, Object> params) {
		R r = purchaseDetailService.queryPurchaseDetailInfo(params);
		return r;
	}

	/**
	 * 确认（拒绝）采购单
	 */
	@PostMapping("/confirm")
	public R confirm(@RequestBody Map<String, Object> params) {
		R r = purchaseOrderService.updateStatus(params);
		return r;
	}

}
