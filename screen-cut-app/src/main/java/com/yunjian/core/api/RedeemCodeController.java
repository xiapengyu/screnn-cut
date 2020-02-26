package com.yunjian.core.api;

import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.service.IRedeemCodeService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/api/redeemCode")
public class RedeemCodeController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IRedeemCodeService redeemCodeService;

    /**
     *用户扫描兑换码
     */
    @GetMapping("/swapCode")
    public ResponseDto swapCode(String redeemNo){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        logger.info("请求地址>>>【{},请求参数>>>【{}】", request.getRequestURL(), request.getQueryString());
        logger.info("用户扫描兑换码{}", redeemNo);
        if(StringUtils.isEmpty(redeemNo)){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
        }
        return redeemCodeService.swapCode(redeemNo);
    }



}
