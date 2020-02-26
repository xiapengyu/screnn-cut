package com.yunjian.core.service;

import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.RedeemCode;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 兑换码信息表 服务类
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-26
 */
public interface IRedeemCodeService extends IService<RedeemCode> {

    PageUtils queryPage(Map<String, Object> params);

    R saveRedeemCode(Map<String, Object> params);

    ResponseDto swapCode(String redeemNo);

}
