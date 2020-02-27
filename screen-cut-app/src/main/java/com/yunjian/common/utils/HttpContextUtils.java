

package com.yunjian.common.utils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.core.entity.SysUserEntity;
import com.yunjian.core.entity.SysUserTokenEntity;
import com.yunjian.core.service.SysUserService;
import com.yunjian.core.service.SysUserTokenService;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

public class HttpContextUtils {

	public static HttpServletRequest getHttpServletRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}

	public static String getDomain(){
		HttpServletRequest request = getHttpServletRequest();
		StringBuffer url = request.getRequestURL();
		return url.delete(url.length() - request.getRequestURI().length(), url.length()).toString();
	}

	public static String getOrigin(){
		HttpServletRequest request = getHttpServletRequest();
		return request.getHeader("Origin");
	}

	public static SysUserEntity getLoginUser(){
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 获取 servlet上下文
		ServletContext sc = request.getServletContext();
		// 获取 spring 容器
		AbstractApplicationContext cxt = (AbstractApplicationContext) WebApplicationContextUtils.getWebApplicationContext(sc);
		SysUserService sysUserServiceImpl = (SysUserService) cxt.getBean("sysUserService");
		SysUserTokenService sysUserTokenServiceImpl = (SysUserTokenService) cxt.getBean("sysUserTokenService");

		String token = request.getHeader("token");
		SysUserTokenEntity tokenEntity = sysUserTokenServiceImpl.getOne(new QueryWrapper<SysUserTokenEntity>()
				.eq("token", token).gt("expire_time", new Date()));

		if(tokenEntity == null){
			return null;
		}
		SysUserEntity userEntity = sysUserServiceImpl.getOne(new QueryWrapper<SysUserEntity>()
				.eq("user_id", tokenEntity.getUserId()));

		return userEntity;
	}
}
