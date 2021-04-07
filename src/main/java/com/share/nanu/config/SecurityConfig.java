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
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

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
		web.httpFirewall(defaultHttpFirewall()); // //(더블슬래시 허용)

		web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**","/scss/**"); //설정한 경로들은 스프링 시큐리티에서 모두 통과
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()								
			.antMatchers("/my/**").access("hasRole('USER')")
			.antMatchers("/sendQR/**").access("hasRole('USER')")
			.antMatchers("/admin/**").access("hasRole('ADMIN')")
			.antMatchers("/**").permitAll()	
			.anyRequest().permitAll()
		.and()
			.formLogin()
			.loginPage("/loginPage")// 인증이 필요하면 로그인으로 이동
			.loginProcessingUrl("/login")
			.usernameParameter("username")
			.passwordParameter("password")
			.successHandler(successHandler())// a페이지-> b페이지(유저권한이필요) -> 로그인페이지-> b페이지로 이동
			//.defaultSuccessUrl("/main",true)
		.and()
			.logout()
			.logoutUrl("/member/logout") //로그아웃하면 메인페이지로 이동						
			.logoutSuccessUrl("/main")
			.deleteCookies("Nanushare_cooki") //로그아웃시 쿠키 삭제
			.invalidateHttpSession(true).permitAll()
		.and()
			.oauth2Login().loginPage("/loginPage")
			//.loginPage("/login")
			//소셜로그인이 완료되면 후처리가 필요함 1.코드받기(인증) 2.엑세스토큰(권한) 3.사용자프로필 가져오기 4. 가져온 정보를 토대로 회원가입을 자동으로 진행
			.userInfoEndpoint() //OAuth2 로그인 성공 이후 사용자 정보를 가져올 때의 설정
			.userService(principalOauth2UserService) 
		//로그인 성공 시 수행 할 UserService 구현체 지정, 엑세스토큰 + 사용자프로필정보 같이 받음
		.and()
			.defaultSuccessUrl("/main"); //소셜 로그인이 성공하면 이동할 주소
		
		http
			.rememberMe()
			.key("Nanushare")
			.rememberMeParameter("Nanushare_rememberMe")
			.rememberMeCookieName("Nanushare_cooki") //f12개발자모드 -> application -> cooki에서 Nanushare_cooki라는 이름으로 쿠키 정보를 확인할 수 있다.
			.userDetailsService(mservice)
			.tokenValiditySeconds(1209600);//2주
		
		
	}
	
	@Bean
	public AuthenticationSuccessHandler successHandler() {
		return new SuccessHandler();
		
	}
	
	@Bean
	public HttpFirewall defaultHttpFirewall() { // 더블슬래시 객체 생성
		return new DefaultHttpFirewall();
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
