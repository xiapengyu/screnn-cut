package com.yunjian.common.utils;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.yunjian.core.dto.SecurityContext;

public class LanguageUtils {

    private static Logger logger = LoggerFactory.getLogger(LanguageUtils.class);

    public static String getValueByKey(String key){
        String language = SecurityContext.getLanguage();
        String value = "";
        try {
            if(StringUtils.isEmpty(language)){
                logger.info("default:{}", Locale.getDefault().toString());
                language = Locale.getDefault().toString();
            }

            if(language.equals("zh_CN")){
                //properties文件编码为iso-8859-1，读取中文需要转码
                value = SecurityContext.getZh_pro().getProperty(key);
                return new String(value.getBytes("ISO-8859-1"), "GBK");
            }else{
                return SecurityContext.getEn_pro().getProperty(key);
            }
        } catch (Exception e) {
            logger.info("获取内容失败", e);
            return value;
        }
    }
}
