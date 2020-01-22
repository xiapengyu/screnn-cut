package com.yunjian.core.dto;

import java.io.Serializable;

import com.yunjian.core.entity.Account;

public class SecurityContext implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static Account user = new Account();
	public static ThreadLocal<Account> userThreadLocal = new ThreadLocal<>();
	public static ThreadLocal<String> tokenLocal = new ThreadLocal<>();

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
}
