package com.yunjian.core.api;

import cn.hutool.core.util.StrUtil;
import com.alibaba.druid.util.StringUtils;
import com.yunjian.common.utils.*;
import com.yunjian.core.dto.GoodsDetailDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.service.IGoodsImgService;
import com.yunjian.core.service.IGoodsService;
import com.yunjian.core.service.IGoodsTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/goods")
public class GoodsController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IGoodsTypeService goodsTypeService;
    @Autowired
    private IGoodsImgService goodsImgService;

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
            return response = new ResponseDto(Constant.FAIL_CODE, null, Constant.FAIL_MESSAGE);
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

    /**
     * 商品加入购物车
     */
    @PostMapping("/addGoodsToCart")
    public ResponseDto addGoodsToCart(@RequestBody Map<String, Object> params){
        logger.info("商品加入购物车{}", JsonUtil.toJsonString(params));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);

        return response;
    }

    /**
     * 商品移除购物车
     */
    @PostMapping("/removeGoodsFromCart")
    public ResponseDto removeGoodsFromCart(@RequestBody Map<String, Object> params){
        logger.info("商品移除购物车{}", JsonUtil.toJsonString(params));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);

        return response;
    }

    /**
     * 提交采购清单
     */
    @PostMapping("/submitCart")
    public ResponseDto submitCart(@RequestBody Map<String, Object> params){
        logger.info("提交采购清单{}", JsonUtil.toJsonString(params));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);

        return response;
    }
}
