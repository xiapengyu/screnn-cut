package com.yunjian.core.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.GoodsCart;

/**
 * <p>
 * 购物车信息表 服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-18
 */
public interface IGoodsCartService extends IService<GoodsCart> {

    ResponseDto addGoodsToCart(String id, String goodsType);

    ResponseDto viewGoodsCartDetail();

    ResponseDto removeGoodsFromCart(int id);

    ResponseDto modifyGoodsCartAmount(int id, int amount);

}
