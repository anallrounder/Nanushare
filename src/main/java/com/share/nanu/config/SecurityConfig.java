package com.share.nanu.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


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
			.loginProcessingUrl("/member/slogin")
			.usernameParameter("username")
			.passwordParameter("password")
			.defaultSuccessUrl("/member/slogin")
		.and()
			.logout()
			.logoutUrl("/member/logout")
			.logoutSuccessUrl("/login")
		.and()
			.exceptionHandling()
			.accessDeniedPage("/denied");
		
		
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
	

}
