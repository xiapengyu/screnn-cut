package com.yunjian.common.filter;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.AccountCache;
import com.yunjian.core.service.IAccountCacheService;

@Configuration
public class LoginFilter implements Filter {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private IAccountCacheService accountCacheServiceImpl;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 获取 servlet上下文
        ServletContext sc = filterConfig.getServletContext();
        // 获取 spring 容器
        AbstractApplicationContext cxt = (AbstractApplicationContext) WebApplicationContextUtils.getWebApplicationContext(sc);
        if (cxt != null && cxt.getBean("accountCacheServiceImpl") != null && accountCacheServiceImpl == null) {
            // 取出 redisUtils
            accountCacheServiceImpl = (IAccountCacheService) cxt.getBean("accountCacheServiceImpl");
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        // 缓存中不存在，提示重新登录
        String token = req.getHeader("token");
        AccountCache accountCache = accountCacheServiceImpl
                .getOne(new QueryWrapper<AccountCache>().eq("token", token).gt("expire_time", new Date()));
        logger.info("token[{}]", token);
        if (accountCache == null) {
            logger.info("Token无效，请重新登录");
            resp.setHeader("Content-type", "application/json;charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            String msg = JsonUtil.toJsonString(new ResponseDto(Constant.TOKEN_IVALID_CODE, null, "Token无效，请重新登录"));
            response.getWriter().print(msg);
        } else {
            logger.info("cache[{}]", JsonUtil.toJsonString(accountCache));
            //更新token失效时间
            long expireTime = new Date().getTime() + 1000 * 60 * 120;
            accountCache.setExpireTime(new Date(expireTime));
            accountCache.setUpdateTime(new Date());
            accountCacheServiceImpl.saveOrUpdate(accountCache);

            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.addHeader("Access-Control-Allow-Origin", "*");
            resp.addHeader("Access-Control-Allow-Credentials", "true");
            resp.addHeader("Access-Control-Allow-Headers",
                    "Origin, X-Requested-With, Content-Type, Accept,X-Pagination");
            resp.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
            resp.addHeader("Access-Control-Expose-Headers", "X-Pagination");
            Account account = JsonUtil.fromJson(accountCache.getAccountInfo(), Account.class);
            SecurityContext.setUser(account);
            chain.doFilter(request, response);
        }
    }
}
