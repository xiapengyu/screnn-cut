package com.yunjian.core.service.impl;

import java.io.InputStream;
import java.util.Properties;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.service.InitService;

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
