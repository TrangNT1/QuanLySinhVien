package com.learncode.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.learncode.CheckPermission;
import com.learncode.CustomUserDetail;
import com.learncode.Utils;
import com.learncode.services.UserServices;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	UserServices userService;
	
	// fix lỗi mất attribute khi live-reload reload sever
	@Bean
	public WebMvcConfigurer webMvcConfig() {
		return new WebMvcConfigurer() {
			@Override
			public void addInterceptors(InterceptorRegistry registry) {
				registry.addInterceptor(new HandlerInterceptor() {
					@Override
					public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
							throws Exception {
						try {
							CustomUserDetail user = Utils.getUser();
							request.getSession().setAttribute("permissions", new CheckPermission(userService.getAllPermission(user.getUsername()),  user.isSuperAdmin()));
						} catch (Exception e) {
							// TODO: handle exception
						}
						return true;
					}
				});
			}
		};
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()//
				.and().authorizeRequests()
				.antMatchers("/login", "/css/**", "/js/**", "/img/**", "/vendor/**", "/scss/**").permitAll()//
				.anyRequest().authenticated() // Tất cả các request khác đều cần phải xác thực mới được truy cập
				.and().formLogin().loginPage("/login").successHandler(new SimpleUrlAuthenticationSuccessHandler() {
					@Override
					public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
							Authentication authentication) throws IOException, ServletException {
						CustomUserDetail user = Utils.getUser();
						request.getSession().setAttribute("permissions", new CheckPermission(
								userService.getAllPermission(user.getUsername()), user.isSuperAdmin()));
						super.onAuthenticationSuccess(request, response, authentication);
					}

				}).permitAll()//
				.and().logout();
		
	}

	@Bean(BeanIds.AUTHENTICATION_MANAGER)
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService).passwordEncoder(passwordEncoder());
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new PasswordEncoder() {
			@Override
			public String encode(CharSequence cs) {
				System.out.println("encode: " + cs);
				return cs.toString();
			}

			@Override
			public boolean matches(CharSequence cs, String string) {
				System.out.println("cs->: " + cs + string);
				return cs.toString().equals(string);
			}

		};
	}
}