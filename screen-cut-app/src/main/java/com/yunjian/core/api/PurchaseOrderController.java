package com.yunjian.core.api;


import com.alibaba.druid.util.StringUtils;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.service.IPurchaseOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
@RequestMapping("/api/purchaseOrder")
public class PurchaseOrderController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IPurchaseOrderService purchaseOrderService;

    /**
     * 分页查询采购单列表
     */
    @PostMapping("/queryOrderByPage")
    public ResponseDto queryOrderByPage(@RequestBody Map<String, Object> params){
        logger.info("分页查询采购单列表{}", JsonUtil.toJsonString(params));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            PageUtils page = purchaseOrderService.queryOrderByPage(params);
            response.setData(page);
        } catch (Exception e) {
            logger.info("分页查询采购单列表失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, Constant.FAIL_MESSAGE);
        }
        return response;
    }

    /**
     * 查询采购单详情
     */
    @PostMapping("/queryOrderDetail")
    public ResponseDto queryOrderDetail(@RequestBody Map<String, Object> params){
        logger.info("查询采购单详情{}", JsonUtil.toJsonString(params));
        String orderNo = StringUtil.obj2String(params.get("orderNo"));
        if(StringUtils.isEmpty(orderNo)){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
        }
        return purchaseOrderService.queryOrderDetail(orderNo);
    }

}
