package com.yunjian.common.filter;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.AccountCache;
import com.yunjian.core.service.IAccountCacheService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.util.StringUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@Configuration
public class LanguageFilter implements Filter {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String language = req.getHeader("Accept-Language");
        if(!StringUtils.isEmpty(language)){
            SecurityContext.setLanguage(language);
        }
        chain.doFilter(request, response);
    }
}
