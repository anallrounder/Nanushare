package com.share.nanu.config;

import org.springframework.context.annotation.Configuration;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	public void configure(WebSecurity web) throws Exception {

		web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**"); //설정한 경로들은 스프링 시큐리티에서 모두 통과
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
			.antMatchers("/member/**").hasRole("USER")
			.antMatchers("/admin/**").hasRole("ADMIN")
			.antMatchers("/**").permitAll()
		.and()
			.formLogin()
			.loginPage("/login")
			.defaultSuccessUrl("/member/slogin").permitAll()
		.and()
			.logout()
				.logoutRequestMatcher(new AntPathRequestMatcher("/member/logout"))
				.logoutSuccessUrl("/member/logout")
				.invalidateHttpSession(true)
		.and()
			.exceptionHandling()
			.accessDeniedPage("/denied");
	}

}
