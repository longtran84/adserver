package com.fintechviet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = "com.fintechviet")
@SpringBootApplication
public class MobileadsApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(MobileadsApplication.class);
	}
	public static void main(String[] args) throws Exception {
		SpringApplication.run(MobileadsApplication.class, args);
	}
}
