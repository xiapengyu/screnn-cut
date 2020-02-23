package com.yunjian.core.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.DateUtils;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.Query;
import com.yunjian.core.dto.GoodsCartInfo;
import com.yunjian.core.dto.OrderReqDto;
import com.yunjian.core.dto.OrderRespDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.Address;
import com.yunjian.core.entity.Goods;
import com.yunjian.core.entity.GoodsCart;
import com.yunjian.core.entity.GoodsImg;
import com.yunjian.core.entity.PurchaseDetail;
import com.yunjian.core.entity.PurchaseOrder;
import com.yunjian.core.mapper.PurchaseOrderMapper;
import com.yunjian.core.service.IAccountService;
import com.yunjian.core.service.IAddressService;
import com.yunjian.core.service.IGoodsImgService;
import com.yunjian.core.service.IGoodsService;
import com.yunjian.core.service.IPurchaseDetailService;
import com.yunjian.core.service.IPurchaseOrderService;

/**
 * <p>
 * 采购订单信息表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
@Service
public class PurchaseOrderServiceImpl extends ServiceImpl<PurchaseOrderMapper, PurchaseOrder> implements IPurchaseOrderService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IPurchaseDetailService purchaseDetailService;
    @Autowired
    private IAddressService addressService;
    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IGoodsImgService goodsImgService;

    @Override
    public ResponseDto submitCart(OrderReqDto param) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            Account account = SecurityContext.getUserPrincipal();
            PurchaseOrder order = new PurchaseOrder();
            order.setOrderNo(createOrderNo());
            order.setComment(param.getComment());
            order.setAccountId(account.getId());
            Address address = addressService.getOne(new QueryWrapper<Address>().eq("id", param.getAddressId()));
            order.setUserName(address.getUserName());
            order.setPhone(address.getPhone());
            order.setAddress(address.getAddress());
            order.setStatus(1);
            order.setCreateTime(new Date());
            order.setUpdateTime(new Date());
            order.setDeleteFlag(1);
            this.saveOrUpdate(order);

            List<PurchaseDetail> detailList = new ArrayList<>();
            for (GoodsCart item : param.getGoodsList()) {
                PurchaseDetail detail = new PurchaseDetail();
                detail.setGoodsId(item.getGoodsId());
                Goods goods = goodsService.getOne(new QueryWrapper<Goods>().eq("id", item.getGoodsId()));
                detail.setAmount(item.getAmount());
                detail.setOrderNo(order.getOrderNo());
                detail.setUnitPrice((goods.getIsDiscount() == 1) ? goods.getDiscountPrice() : goods.getPrice());
                detail.setPrice(detail.getUnitPrice().multiply(BigDecimal.valueOf(detail.getAmount().doubleValue())));
                detailList.add(detail);
            }
            if (!detailList.isEmpty()) {
                purchaseDetailService.saveBatch(detailList);
            } else {
                this.remove(new QueryWrapper<PurchaseOrder>().eq("id", order.getId()));
                return new ResponseDto(Constant.FAIL_CODE, null, "没有采购商品");
            }
        } catch (Exception e) {
            logger.error("提交采购单失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "提交采购单失败");
        }
        return response;
    }

    @Override
    public PageUtils queryOrderByPage(Map<String, Object> params) {
        Account account = SecurityContext.getUserPrincipal();
        QueryWrapper<PurchaseOrder> queryWrapper = new QueryWrapper<PurchaseOrder>();
        queryWrapper.eq("account_id", account.getId())
                .eq("delete_flag", 1)
                .orderByDesc("create_time");
        IPage<PurchaseOrder> page = this.page(new Query<PurchaseOrder>().getPage(params), queryWrapper);
        return new PageUtils(page);
    }
    
    @Override
    public PageUtils queryOrderByPage4Sys(Map<String, Object> params) {
        QueryWrapper<PurchaseOrder> queryWrapper = new QueryWrapper<PurchaseOrder>();
        IPage<PurchaseOrder> page = this.page(new Query<PurchaseOrder>().getPage(params), queryWrapper);
        return new PageUtils(page);
    }

    @Override
    public ResponseDto queryOrderDetail(String orderNo) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            PurchaseOrder order = this.getOne(new QueryWrapper<PurchaseOrder>().eq("order_no", orderNo));
            OrderRespDto dto = new OrderRespDto();
            BeanUtils.copyProperties(order, dto);
            BigDecimal totalPrice = BigDecimal.ZERO;
            List<GoodsCartInfo> goodsList = new ArrayList<>();
            List<PurchaseDetail> detailList = purchaseDetailService.list(new QueryWrapper<PurchaseDetail>().eq("order_no", orderNo));
            for (PurchaseDetail item : detailList) {
                GoodsCartInfo info = new GoodsCartInfo();
                Goods goods = goodsService.getOne(new QueryWrapper<Goods>().eq("id", item.getGoodsId()));
                info.setId(item.getGoodsId());
                info.setName(goods.getName());
                info.setAmount(item.getAmount());
                info.setUnitPrice(item.getUnitPrice());
                info.setTotalPrice(item.getPrice());
                totalPrice = totalPrice.add(item.getUnitPrice().multiply(BigDecimal.valueOf(info.getAmount().doubleValue())));
                List<GoodsImg> imgList = goodsImgService.list(
                        new QueryWrapper<GoodsImg>()
                                .eq("goods_id", item.getId()).orderByAsc("create_time"));
                if (!imgList.isEmpty()) {
                    info.setCoverImg(imgList.get(0).getImageUrl());
                }
                goodsList.add(info);
            }
            dto.setTotalPrice(totalPrice);
            dto.setGoodsList(goodsList);
            response.setData(dto);
        } catch (BeansException e) {
            logger.error("查看采购详情失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "查看采购详情失败");
        }
        return response;
    }

    @Override
    public PageUtils queryAccountOrderList(Map<String, Object> params) {
        QueryWrapper<PurchaseOrder> queryWrapper = new QueryWrapper<PurchaseOrder>();
        queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
        IPage<PurchaseOrder> page = this.page(new Query<PurchaseOrder>().getPage(params), queryWrapper);
        return new PageUtils(page);
    }

    @Override
    public OrderRespDto queryOrderInfo(String orderNo) {
        PurchaseOrder order = this.getOne(new QueryWrapper<PurchaseOrder>().eq("order_no", orderNo));
        OrderRespDto dto = new OrderRespDto();
        BeanUtils.copyProperties(order, dto);

        List<GoodsCartInfo> goodsList = new ArrayList<>();
        List<PurchaseDetail> detailList = purchaseDetailService.list(new QueryWrapper<PurchaseDetail>().eq("order_no", orderNo));
        for (PurchaseDetail item : detailList) {
            GoodsCartInfo info = new GoodsCartInfo();
            Goods goods = goodsService.getOne(new QueryWrapper<Goods>().eq("id", item.getGoodsId()));
            info.setId(item.getGoodsId());
            info.setName(goods.getName());
            info.setAmount(item.getAmount());
            info.setUnitPrice(item.getUnitPrice());
            info.setTotalPrice(item.getPrice());
            List<GoodsImg> imgList = goodsImgService.list(
                    new QueryWrapper<GoodsImg>()
                            .eq("goods_id", item.getId()).orderByAsc("create_time"));
            if (!imgList.isEmpty()) {
                info.setCoverImg(imgList.get(0).getImageUrl());
            }
            goodsList.add(info);
        }
        dto.setGoodsList(goodsList);
        return dto;
    }

    private String createOrderNo() {
        String orderNo = "";
        String prefix = DateUtils.format(new Date(), "yyyyMMddHHmmss");
        String suffix = (int) ((Math.random() * 9 + 1) * 1000000) + "";
        orderNo = prefix + suffix;
        return orderNo;
    }
}
