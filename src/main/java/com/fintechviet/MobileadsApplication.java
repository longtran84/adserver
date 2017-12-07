package com.fintechviet;

import com.fintechviet.quartz.configuration.ConfigureQuartz;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;

@ComponentScan(basePackages = "com.fintechviet")
@Import({ConfigureQuartz.class})
@SpringBootApplication(exclude = {
		org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration.class,
		org.activiti.spring.boot.SecurityAutoConfiguration.class,
		org.springframework.boot.actuate.autoconfigure.ManagementWebSecurityAutoConfiguration.class })
public class MobileadsApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		setRegisterErrorPageFilter(false);
		return application.sources(MobileadsApplication.class);
	}
	public static void main(String[] args) throws Exception {
		SpringApplication.run(MobileadsApplication.class, args);
	}
}
