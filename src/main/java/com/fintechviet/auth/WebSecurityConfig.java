package com.fintechviet.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Value("${devmode}")
	private boolean devMode;
    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	//if(devMode) http.csrf().disable();
        //http.csrf().disable().authorizeRequests().anyRequest();
        http.csrf().ignoringAntMatchers("/news/**/");
        http
        .authorizeRequests()
        .antMatchers(HttpMethod.POST, "/news/**").permitAll()
        .antMatchers("/resources/**", "/registration").permitAll()
                .antMatchers("/resources/**", "/advertiserRegistration").permitAll()
        //.antMatchers(HttpMethod.GET,"/advertiser").hasAnyRole("ROLE_ADMIN", "ROLE_ADVERTISER")
        //.antMatchers(HttpMethod.POST,"/advertiser").hasAnyRole("ROLE_ADMIN", "ROLE_ADVERTISER")
        .anyRequest().authenticated()
        .and()
        .formLogin().loginPage("/login")
        .permitAll()
        .and()
        .logout()
        .permitAll();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(md5PasswordEncoder());
    }

    @Bean
    public Md5PasswordEncoder md5PasswordEncoder() throws Exception {
        return new Md5PasswordEncoder();
    }
}