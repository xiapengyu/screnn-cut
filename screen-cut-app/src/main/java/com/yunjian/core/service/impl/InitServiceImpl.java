package com.yunjian.core.service.impl;

import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.service.InitService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Locale;
import java.util.Properties;

import javax.annotation.PostConstruct;

@Service
public class InitServiceImpl implements InitService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @PostConstruct
    public void initLocale() {
        try {
            logger.info("初始化加载语言配置文件");
            InputStream en_stream = this.getClass().getClassLoader().getResourceAsStream("language_en_US.properties");
            Properties en_pro = new Properties();
            en_pro.load(en_stream);

            InputStream zn_stream = this.getClass().getClassLoader().getResourceAsStream("language_zh_CN.properties");
            Properties zh_pro = new Properties();
            zh_pro.load(zn_stream);

            SecurityContext.setEn_pro(en_pro);
            SecurityContext.setZh_pro(zh_pro);
        } catch (Exception e) {
            logger.error("语言配置文件加载失败", e);
        }
    }

}
