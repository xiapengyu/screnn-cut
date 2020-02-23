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
    	R r = R.ok();
    	String orderNo = (String) params.get("orderNo");
    	QueryWrapper<PurchaseOrder> queryWrapper = new QueryWrapper<PurchaseOrder>();
    	queryWrapper.eq("order_no", orderNo);
    	List<PurchaseOrder> orderList = purchaseOrderService.list(queryWrapper);
    	if(orderList!=null && orderList.size() > 0) {
    		List<PurchaseDetailVo> detailList = purchaseDetailService.queryPurchaseDetailInfo(orderList.get(0).getOrderNo());
    		r.put("order", orderList.get(0));
    		r.put("detailList", detailList);
    	}
        return r;
    }

//    /**
//     * 查询采购单详情
//     */
//    @PostMapping("/queryOrderDetail")
//    public ResponseDto queryOrderDetail(@RequestBody Map<String, Object> params){
//        logger.info("查询采购单详情{}", JsonUtil.toJsonString(params));
//        String orderNo = StringUtil.obj2String(params.get("orderNo"));
//        if(StringUtils.isEmpty(orderNo)){
//            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
//        }
//        return purchaseOrderService.queryOrderDetail(orderNo);
//    }

}
