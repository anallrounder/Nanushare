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
			
			.antMatchers("/member/**").authenticated()
			//.antMatchers("/member/**").access("hasRole('USER')")
			.antMatchers("/admin/**").access("hasRole('ADMIN')")	
			.anyRequest().permitAll()
		.and()
			.formLogin()
			.loginPage("/login").permitAll()// 인증이 필요하면 로그인으로 이동
			.loginProcessingUrl("/member/slogin")
			.usernameParameter("username")
			.passwordParameter("password")
			.defaultSuccessUrl("/member/slogin",true)
		.and()
			.logout()
			.logoutUrl("/member/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true).permitAll()
		.and()
			.oauth2Login().loginPage("/login")
			//.loginPage("/login")
			//소셜로그인이 완료되면 후처리가 필요함 1.코드받기(인증) 2.엑세스토큰(권한) 3.사용자프로필 가져오기 4. 가져온 정보를 토대로 회원가입을 자동으로 진행
			.userInfoEndpoint() //OAuth2 로그인 성공 이후 사용자 정보를 가져올 때의 설정
			.userService(principalOauth2UserService) 
		//로그인 성공 시 수행 할 UserService 구현체 지정, 엑세스토큰 + 사용자프로필정보 같이 받음
		.and()
			.defaultSuccessUrl("/member/slogin"); //소셜 로그인이 성공하면 이동할 주소
		
		
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
