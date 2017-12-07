package com.fintechviet.auth;

import com.fintechviet.CustomAuthenticationSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
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
        .antMatchers("/resources/**", "/forgotPassword").permitAll()
        .antMatchers("/resources/**", "/ad/**").permitAll()
        .antMatchers("/resources/**", "/images/**").permitAll()
        .antMatchers("/resources/**", "/loyalty/**").permitAll()
        .antMatchers("/sendResetPassword").permitAll()
                .antMatchers(HttpMethod.GET,"/loyalty/order/process").permitAll()
        .antMatchers("/resetPassword", "/newPassword", "/newPasswordSuccess").permitAll()
        .antMatchers("/admin_profile").access("hasRole('ROLE_SUPER_ADMIN') or hasRole('ROLE_ADMIN')")
        .antMatchers("/system/systemParameter").access("hasRole('ROLE_SUPER_ADMIN') or hasRole('ROLE_ADMIN')")
        .antMatchers("/system/admin/**").access("hasRole('ROLE_SUPER_ADMIN')")
        .antMatchers("/user/userInfo").access("hasRole('ROLE_SUPER_ADMIN') or hasRole('ROLE_ADMIN')")
        .antMatchers("/user/userInvite").access("hasRole('ROLE_SUPER_ADMIN') or hasRole('ROLE_ADMIN')")
        .antMatchers("/userInterestReports").access("hasRole('ROLE_SUPER_ADMIN') or hasRole('ROLE_ADMIN')")
        .anyRequest().authenticated()
        .and()
        .formLogin().successHandler(successHandler())
        .loginPage("/login")
        //.defaultSuccessUrl("/")
        .permitAll()
        .and()
        .logout()
        .permitAll()
        .and().exceptionHandling().accessDeniedPage("/accessDenied");
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(md5PasswordEncoder());
    }

    @Bean
    public Md5PasswordEncoder md5PasswordEncoder() throws Exception {
        return new Md5PasswordEncoder();
    }

    @Bean
    public AuthenticationSuccessHandler successHandler() {
        return new CustomAuthenticationSuccessHandler("/");
    }

    @Bean(name = BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
}