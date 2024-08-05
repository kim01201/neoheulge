package com.example.neoheulge.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity(debug = false)
public class SpringSecurityConfig {

	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
			http
	        .authorizeHttpRequests(authz -> authz
//	            .requestMatchers("/WEB-INF/views/index.jsp", "/css/**","/img/**").permitAll()
	            .requestMatchers("/**", "/css/**","/img/**").permitAll()
	            .anyRequest().authenticated()  // 나머지 경로는 인증 필요
	        )
	        .formLogin(form -> form
	            .loginPage("/login.do") // 로그인 페이지 설정
	            .permitAll()  // 로그인 페이지는 모든 사용자에게 허용
	        )
	        .httpBasic(basic -> basic.disable()); // HTTP Basic 인증 비활성화
	    return http.build();
	}
	@Bean
    WebSecurityCustomizer webSecurityCustomizer() { // security를 적용하지 않을 리소스
        return web -> web.ignoring()
                // error endpoint를 열어줘야 함, favicon.ico 추가!
                .requestMatchers("/error", "/favicon.ico", "/");
    }
}
