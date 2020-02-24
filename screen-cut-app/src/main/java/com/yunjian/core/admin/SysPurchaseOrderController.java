package com.yunjian.core.admin;


import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.PurchaseOrder;
import com.yunjian.core.service.IPurchaseDetailService;
import com.yunjian.core.service.IPurchaseOrderService;
import com.yunjian.core.vo.PurchaseDetailVo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

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
    public R queryOrderByPage(@RequestBody Map<String, Object> params){
    	 logger.info("分页查询采购单列表{}", JsonUtil.toJsonString(params));
         PageUtils page = purchaseOrderService.queryOrderByPage4Sys(params);
         return R.ok().put("page", page);
    }
    
    
    /**
     * 查看采购单详情
     */
    @PostMapping("/detail")
    public R queryDetail(@RequestBody Map<String, Object> params){
    	String orderNo = (String) params.get("orderNo");
    	R r = purchaseDetailService.queryPurchaseDetailInfo(orderNo);
        return r;
    }

    /**
     * 确认（拒绝）采购单
     */
    @PostMapping("/confirm")
    public R confirm(@RequestBody Map<String, Object> params){
    	R r = purchaseOrderService.updateStatus(params);
        return r;
    }

}
