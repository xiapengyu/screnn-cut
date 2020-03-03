package com.yunjian.core.dto;

import java.io.Serializable;
import java.util.Properties;

import com.yunjian.core.entity.Account;

public class SecurityContext implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static Account user = new Account();
	public static ThreadLocal<Account> userThreadLocal = new ThreadLocal<>();
	public static ThreadLocal<String> tokenLocal = new ThreadLocal<>();
	public static String language = "";
	public static Properties en_pro = new Properties();
	public static Properties zh_pro = new Properties();

	private SecurityContext() {
		
	}

	public static void setUser(Account user) {
		SecurityContext.user = user;
	}

	public static Account getLoginUser() {
		return user;
	}

	public static Account getUserPrincipal() {
		return user;
		//return userThreadLocal.get();
	}

	public static void setUserPrincipal(Account user) {
		SecurityContext.user = user;
		//userThreadLocal.set(user);
	}

	public static String getToken() {
		return tokenLocal.get();
	}

	public static void setToken(String token) {
		tokenLocal.set(token);
	}

	public static String getLanguage() {
		return language;
	}

	public static void setLanguage(String language) {
		SecurityContext.language = language;
	}

	public static Properties getEn_pro() {
		return en_pro;
	}

	public static void setEn_pro(Properties en_pro) {
		SecurityContext.en_pro = en_pro;
	}

	public static Properties getZh_pro() {
		return zh_pro;
	}

	public static void setZh_pro(Properties zh_pro) {
		SecurityContext.zh_pro = zh_pro;
	}
}
