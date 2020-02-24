package com.yunjian.core.api;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.dto.OrderReqDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.GoodsCart;
import com.yunjian.core.service.IGoodsCartService;
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
 * 购物车信息表 前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@RestController
@RequestMapping("/api/goodsCart")
public class GoodsCartController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IGoodsCartService goodsCartService;
    @Autowired
    private IPurchaseOrderService purchaseOrderService;

    /**
     * 商品加入购物车
     */
    @PostMapping("/addGoodsToCart")
    public ResponseDto addGoodsToCart(@RequestBody Map<String, Object> params){
        logger.info("商品加入购物车{}", JsonUtil.toJsonString(params));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        if(params.get("id") == null){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "未选择商品");
        }else if(params.get("typeId") == null){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "未选择种类");
        }
        return goodsCartService.addGoodsToCart(StringUtil.obj2String(params.get("id")), StringUtil.obj2String(params.get("typeId")));
    }

    /**
     * 查看购物车详情
     */
    @PostMapping("/viewGoodsCartDetail")
    public ResponseDto viewGoodsCartDetail(){
        logger.info("查看购物车详情");
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        return goodsCartService.viewGoodsCartDetail();
    }

    /**
     * 从购物车移除商品
     */
    @PostMapping("/removeGoodsFromCart")
    public ResponseDto removeGoodsFromCart(@RequestBody Map<String, Object> params){
        logger.info("从购物车移除商品{}", JsonUtil.toJsonString(params));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        if(params.get("id") == null){
            return new ResponseDto(Constant.FAIL_CODE, null, "未选择商品");
        }
        return goodsCartService.removeGoodsFromCart(Integer.parseInt(StringUtil.obj2String(params.get("id"))));
    }

    /**
     * 修改购物车商品数量
     */
    @PostMapping("/modifyGoodsCartAmount")
    public ResponseDto modifyGoodsCartAmount(@RequestBody Map<String, Object> params){
        logger.info("修改购物车商品数量{}", JsonUtil.toJsonString(params));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        if(params.get("id") == null || params.get("amount") == null){
            return new ResponseDto(Constant.FAIL_CODE, null, "未选择商品");
        }else if(Integer.parseInt(StringUtil.obj2String(params.get("amount"))) < 0){
            return new ResponseDto(Constant.FAIL_CODE, null, "商品数量不能小于0");
        }
        return goodsCartService.modifyGoodsCartAmount(Integer.parseInt(StringUtil.obj2String(params.get("id"))),
                Integer.parseInt(StringUtil.obj2String(params.get("amount"))));
    }

    /**
     * 一键清空用户购物车
     */
    @PostMapping("/clearUserGoodsCart")
    public ResponseDto clearUserGoodsCart(){
        logger.info("一键清空购物车");
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            Account account = SecurityContext.getUserPrincipal();
            goodsCartService.remove(new QueryWrapper<GoodsCart>().eq("account_id", account.getId()));
        } catch (Exception e) {
            logger.error("一键清空购物车失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "一键清空购物车失败");
        }
        return response;
    }

    /**
     * 提交采购清单
     */
    @PostMapping("/submitCart")
    public ResponseDto submitCart(@RequestBody OrderReqDto param){
        logger.info("提交采购清单{}", JsonUtil.toJsonString(param));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        if(param.getAddressId() == null){
            return new ResponseDto(Constant.FAIL_CODE, null, "没有收货地址信息");
        }
        return purchaseOrderService.submitCart(param);
    }

}
