package com.yunjian;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class ScreenCutApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(ScreenCutApplication.class, args);
	}

}