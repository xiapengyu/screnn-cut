package com.yunjian.core.config;

import javax.servlet.DispatcherType;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.DelegatingFilterProxy;
import com.yunjian.common.filter.LoginFilter;
import com.yunjian.common.filter.SessionFilter;

/**
 * Filter配置
 *
 *
 */
@Configuration
public class FilterConfig {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Bean
	public FilterRegistrationBean shiroFilterRegistration() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setFilter(new DelegatingFilterProxy("shiroFilter"));
		// 该值缺省为false，表示生命周期由SpringApplicationContext管理，设置为true则表示由ServletContainer管理
		registration.addInitParameter("targetFilterLifecycle", "true");
		registration.setEnabled(true);
		registration.setOrder(Integer.MAX_VALUE - 2);
		registration.addUrlPatterns("/*");
		return registration;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Bean
	public FilterRegistrationBean loginFilterRegistration() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setDispatcherTypes(DispatcherType.REQUEST);
		registration.setFilter(new LoginFilter());
		registration.addUrlPatterns("/api/*");
		registration.setName("loginFilter");
		registration.setOrder(Integer.MAX_VALUE - 1);
		return registration;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Bean
	public FilterRegistrationBean sessionFilterRegistration() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setDispatcherTypes(DispatcherType.REQUEST);
		registration.setFilter(new SessionFilter());
		registration.addUrlPatterns("/api/*");
		registration.setName("sessionFilter");
		registration.setOrder(Integer.MAX_VALUE);
		return registration;
	}
}
