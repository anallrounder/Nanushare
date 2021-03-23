package com.share.nanu.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.share.nanu.security.MemberDetailsService;
import com.share.nanu.service.PrincipalOauth2UserService;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
	@Autowired
	private MemberDetailsService mservice;
	
	@Override
	public void configure(WebSecurity web) throws Exception {

		web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**"); //설정한 경로들은 스프링 시큐리티에서 모두 통과
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
			.antMatchers("/**").permitAll()
			.antMatchers("/member/**").access("hasRole('USER')")
			.antMatchers("/admin/**").access("hasRole('ADMIN')")			
		.and()
			.formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/member/slogin")
			.usernameParameter("username")
			.passwordParameter("password")
			.defaultSuccessUrl("/member/slogin",true)
		.and()
			.logout()
			.logoutUrl("/member/logout")
			.logoutSuccessUrl("/login")
		.and()
			.oauth2Login()
			.loginPage("/login")
			.userInfoEndpoint() //OAuth2 로그인 성공 이후 사용자 정보를 가져올 때의 설정
			.userService(principalOauth2UserService) //로그인 성공 시 수행 할 UserService 구현체 지정
		.and()
			.defaultSuccessUrl("/member/slogin");
	}
	
	//해당 메소드의 리턴되는 오브젝트를 ioc로 등록
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.userDetailsService(mservice).passwordEncoder(passwordEncoder());
	}
	
}
