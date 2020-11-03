//package com.learncode.services;
//
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//
//import javax.sql.DataSource;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
//import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
//
//import com.learncode.models.ChucNang1;
//import com.learncode.models.Nguoidung;
//import com.learncode.repository.ChucNang1Repository;
//import com.learncode.service.ChucNang1Service;
//import com.learncode.service.NguoiDungService;
//import com.learncode.service.UserDetailServiceImpl;
//
//
//@Configuration
//@EnableWebSecurity
//public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
//
//	private Nguoidung nguoidung;
//	
//	@Autowired
//	private NguoiDungService nguoiDungService;
//	
//	@Autowired
//	private ChucNang1Service chucNang1Service;
//	
//	@Bean
//	public UserDetailsService userDetailsService() {
//		return new UserDetailServiceImpl();
//	}
//	
//	@Bean
//	public BCryptPasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
//	
//	@Bean
//	public DaoAuthenticationProvider authenticationProvider() {
//		DaoAuthenticationProvider auProvider = new DaoAuthenticationProvider();
//		auProvider.setPasswordEncoder(passwordEncoder());
//		auProvider.setUserDetailsService(userDetailsService());
//		
//		return auProvider;
//	}
//
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.authenticationProvider(authenticationProvider());
//	}
//
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//
//		http.csrf().disable();
//        // Các trang không yêu cầu login
//        http.authorizeRequests().antMatchers("/").permitAll();
//		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
//		http.authorizeRequests()
//			.and()
//			.formLogin()
//			.loginPage("/login")
//			.defaultSuccessUrl("/success").permitAll()
//			.and()
//			.logout();
//
//	}
//
//
//	
//	
//}
