package com.share.nanu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity //스프링 시큐리티 활성화
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	//private final UserService userService; //유저정보 가져올 클래스
	
	
	@Override
	public void configure(WebSecurity web) { //인증을 무시할 경로, WebSecurityConfigurerAdapter 상속시 사용가능
		
		web.ignoring().antMatchers("/css","/js/**","/img/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {//http 관련인증 설정
		http.
			authorizeRequests()
				.antMatchers("/login","/join").permitAll()//모두접근가능
				.antMatchers("/").hasRole("role_user") //유저만 접근가능
				.antMatchers("/admin").hasRole("role_admin")//admin만 접근가능
				.anyRequest().authenticated()// 나머지 요청들은 권한 종류 상관없이 권한이 있어야 접근가능
			.and()
				.formLogin()
					.loginPage("login") //로그인 페이지 링크
					.defaultSuccessUrl("/index")//로그인 성공후 리다이렉트 주소
			.and()
				.logout() //로그아웃
					.logoutSuccessUrl("/login")
					.invalidateHttpSession(true); //세션 날리기
		
	}
	
	/*
	 * @Override protected void configure(AuthenticationManagerBuilder auth) throws
	 * Exception { //로그인시 필요정보 가져오기
	 * 
	 * auth.userDetailsService(userService).passwordEncoder(new
	 * BCryptPasswordEncoder()); }
	 */

}
