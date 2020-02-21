package com.yunjian.core.api;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.*;
import com.yunjian.core.dto.GoodsDetailDto;
import com.yunjian.core.dto.OrderReqDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.GoodsCart;
import com.yunjian.core.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/goods")
public class GoodsController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IGoodsCartService goodsCartService;
    @Autowired
    private IPurchaseOrderService purchaseOrderService;

    /**
     * 分页查询商品列表
     */
    @PostMapping("/queryGoodsByPage")
    public ResponseDto queryGoodsByPage(@RequestBody Map<String, Object> params){
        logger.info("分页查询商品列表{}", JsonUtil.toJsonString(params));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            PageUtils page = goodsService.queryGoodsByPage(params);
            response.setData(page);
        } catch (Exception e) {
            logger.info("分页查询商品列表失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, Constant.FAIL_MESSAGE);
        }
        return response;
    }

    /**
     * 查询商品详情
     */
    @PostMapping("/queryGoodsDetail")
    public ResponseDto queryGoodsDetail(@RequestBody Map<String, Object> params){
        logger.info("查询商品详情{}", JsonUtil.toJsonString(params));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(StringUtils.isEmpty(id)){
                return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
            }else{
                GoodsDetailDto detail = goodsService.queryGoodsDetail(id);
                response.setData(detail);
            }
        } catch (Exception e) {
            logger.info("查询商品详情失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, Constant.FAIL_MESSAGE);
        }
        return response;
    }

}
