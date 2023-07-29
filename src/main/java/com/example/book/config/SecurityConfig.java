package com.example.book.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class SecurityConfig {

	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf().disable()
		.authorizeHttpRequests()
		.antMatchers("/member/*").authenticated()
		.anyRequest()
		.permitAll()
		.and()
		  .formLogin()
		  .loginPage("/login")
		  .loginProcessingUrl("/loginPro")
		  .defaultSuccessUrl("/")
		 .and()
		   .logout()
		   .logoutUrl("/logout")
		   .logoutSuccessUrl("/")
		   .invalidateHttpSession(true);
		return http.build();
	}
	
}
