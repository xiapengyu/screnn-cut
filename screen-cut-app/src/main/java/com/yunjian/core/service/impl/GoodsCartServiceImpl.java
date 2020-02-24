package com.yunjian.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.core.dto.*;
import com.yunjian.core.entity.*;
import com.yunjian.core.mapper.GoodsCartMapper;
import com.yunjian.core.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 购物车信息表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@Service
public class GoodsCartServiceImpl extends ServiceImpl<GoodsCartMapper, GoodsCart> implements IGoodsCartService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private IAddressService addressService;

    @Autowired
    private IGoodsImgService goodsImgService;

    @Autowired
    private IGoodsTypeService goodsTypeService;

    @Override
    public ResponseDto addGoodsToCart(String id, String goodsType) {
        try {
            Account account = SecurityContext.getUserPrincipal();
            Goods goods = goodsService.getOne(new QueryWrapper<Goods>().eq("id", Integer.parseInt(id)));
            if(goods == null){
                return new ResponseDto(Constant.FAIL_CODE, null, "商品不存在");
            }
            //商品单价
            BigDecimal unitPrice = (goods.getIsDiscount()) == 1 ? goods.getDiscountPrice() : goods.getPrice();
            //判断购物车中是否已经存在
            GoodsCart goodsCart = this.getOne(new QueryWrapper<GoodsCart>().eq("account_id", account.getId())
                    .eq("goods_id", goods.getId()).eq("goods_type", Integer.parseInt(goodsType)));
            if(goodsCart != null){
                goodsCart.setAmount(goodsCart.getAmount() + 1);
                BigDecimal totalPrice = unitPrice.multiply(BigDecimal.valueOf(goodsCart.getAmount().doubleValue()));
                goodsCart.setTotalPrice(totalPrice);
            }else{
                goodsCart = new GoodsCart();
                goodsCart.setGoodsId(goods.getId());
                goodsCart.setAccountId(account.getId());
                goodsCart.setAmount(1);
                goodsCart.setTotalPrice(unitPrice);
                goodsCart.setGoodsType(Integer.parseInt(goodsType));
            }
            this.saveOrUpdate(goodsCart);

            //更新销量
            goods.setSaleAmount(goods.getSaleAmount() + 1);
            goodsService.saveOrUpdate(goods);
        } catch (Exception e) {
            logger.error("添加购物车失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "添加购物车失败");
        }
        return new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
    }

    @Override
    public ResponseDto viewGoodsCartDetail() {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        Account account = SecurityContext.getUserPrincipal();
        List<GoodsCart> goodsCartList = this.list(new QueryWrapper<GoodsCart>().eq("account_id", account.getId()));

        GoodsCartDto dto = new GoodsCartDto();
        Address defaultAddress = addressService
                .getOne(new QueryWrapper<Address>().eq("account_id", account.getId()).eq("is_default", 1));
        dto.setAddress(defaultAddress);
        if(!goodsCartList.isEmpty()){
            List<GoodsCartInfo> goodsList = new ArrayList<>();
            for(GoodsCart goodsCart : goodsCartList){
                GoodsCartInfo info = new GoodsCartInfo();
                Goods goods = goodsService.getOne(new QueryWrapper<Goods>().eq("id", goodsCart.getGoodsId()));
                info.setId(goods.getId());
                info.setName(goods.getName());
                info.setAmount(goodsCart.getAmount());
                info.setUnitPrice((goods.getIsDiscount() == 1) ? goods.getDiscountPrice() : goods.getPrice());
                BigDecimal totalPrice = info.getUnitPrice().multiply(BigDecimal.valueOf(info.getAmount().doubleValue()));
                info.setTotalPrice(totalPrice);
                info.setGoodsType(goodsCart.getGoodsType());
                GoodsType type = goodsTypeService.getOne(new QueryWrapper<GoodsType>().eq("id", goodsCart.getGoodsType()));
                if(type != null){
                    info.setGoodsTypeName(type.getTypeName());
                }
                List<GoodsImg> imgList = goodsImgService.list(
                        new QueryWrapper<GoodsImg>()
                                .eq("goods_id", goods.getId()).orderByAsc("create_time"));
                if(!imgList.isEmpty()){
                    info.setCoverImg(imgList.get(0).getImageUrl());
                }
                goodsList.add(info);
            }
            dto.setGoodsList(goodsList);
        }
        response.setData(dto);
        return response;
    }

    @Override
    public ResponseDto removeGoodsFromCart(int id) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            Account account = SecurityContext.getUserPrincipal();
            QueryWrapper<GoodsCart> queryWrapper = new QueryWrapper<GoodsCart>().eq("account_id", account.getId()).eq("goods_id", id);
            GoodsCart goodsCart = this.getOne(queryWrapper);
            //更新销量
            Goods goods = goodsService.getOne(new QueryWrapper<Goods>().eq("id", goodsCart.getGoodsId()));
            int sale = goods.getSaleAmount() - goodsCart.getAmount();
            goods.setSaleAmount( (sale > 0) ? sale : 0);
            goodsService.saveOrUpdate(goods);

            this.remove(queryWrapper);
        } catch (Exception e) {
            logger.error("从购物车移除商品失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "从购物车移除商品失败");
        }
        return response;
    }

    @Override
    public ResponseDto modifyGoodsCartAmount(int id, int amount) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            Account account = SecurityContext.getUserPrincipal();

            Goods goods = goodsService.getOne(new QueryWrapper<Goods>().eq("id", id));
            if(goods == null){
                return new ResponseDto(Constant.FAIL_CODE, null, "商品不存在");
            }
            //更新购物车中商品数量与总价
            BigDecimal unitPrice = (goods.getIsDiscount()) == 1 ? goods.getDiscountPrice() : goods.getPrice();
            GoodsCart goodsCart = this.getOne(new QueryWrapper<GoodsCart>().eq("account_id", account.getId()).eq("goods_id", id));
            int oldAmount = goodsCart.getAmount();
            goodsCart.setAmount(amount);
            goodsCart.setTotalPrice(unitPrice.multiply(BigDecimal.valueOf(Long.parseLong(amount + ""))));
            this.saveOrUpdate(goodsCart);

            //更新销量
            int sale = amount - oldAmount;
            goods.setSaleAmount(goods.getSaleAmount() + sale);
            goodsService.saveOrUpdate(goods);
        } catch (Exception e) {
            logger.error("修改购物车商品数量失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "修改购物车商品数量失败");
        }
        return response;
    }

}
