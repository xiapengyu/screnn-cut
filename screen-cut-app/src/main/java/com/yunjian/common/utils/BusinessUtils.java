package com.yunjian.common.utils;

import java.util.Date;

public class BusinessUtils {
	
    public static String createOrderNo() {
        String orderNo = "";
        String prefix = DateUtils.format(new Date(), "yyyyMMddHHmmss");
        String suffix = (int) ((Math.random() * 9 + 1) * 1000000) + "";
        orderNo = prefix + suffix;
        return orderNo;
    }

}
