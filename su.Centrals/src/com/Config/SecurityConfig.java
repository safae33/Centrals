package com.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Override
    protected void configure(final HttpSecurity http) throws Exception {
		  http
		  .csrf().disable()
	      .authorizeRequests()
	      .antMatchers("/login").anonymous()
	      .antMatchers("/login*").permitAll()
	      .antMatchers("/default*").permitAll()
	      .antMatchers(HttpMethod.GET, "/showToOwner").hasAnyAuthority("OWNER")
	      .antMatchers(HttpMethod.GET, "/santralArizalari").hasAnyAuthority("OWNER")
	      .antMatchers(HttpMethod.GET, "/santralArizalari/*").hasAnyAuthority("OWNER")
	      .antMatchers(HttpMethod.GET, "/tech").hasAnyAuthority("TECH")
	      .antMatchers(HttpMethod.GET, "/tech/{arizaId}").hasAnyAuthority("TECH")
	      .antMatchers(HttpMethod.GET, "/addInput/{id}").hasAnyAuthority("USER")
	      .antMatchers(HttpMethod.GET, "/arizaBildirimi").hasAnyAuthority("USER")
	      .antMatchers(HttpMethod.POST, "/addI/{id}").hasAnyAuthority("USER")
	      .antMatchers(HttpMethod.POST, "/addFaultForAdminPost").hasAnyAuthority("USER")
	      .antMatchers(HttpMethod.GET, "/showAll").hasAnyAuthority("ADMIN")
	      .antMatchers(HttpMethod.GET, "/kullaniciEkle").hasAnyAuthority("ADMIN")
	      .antMatchers(HttpMethod.GET, "/santralEkle").hasAnyAuthority("ADMIN")
	      .antMatchers(HttpMethod.GET, "/*").hasAnyAuthority("ADMIN")
	      .antMatchers(HttpMethod.GET, "/ariza/{id}").hasAnyAuthority("ADMIN")
	      .antMatchers(HttpMethod.POST, "/addU").hasAnyAuthority("ADMIN")
	      .antMatchers(HttpMethod.POST, "/addC").hasAnyAuthority("ADMIN")
	      .antMatchers(HttpMethod.POST, "/addFault").hasAnyAuthority("ADMIN")
	      
	      
	      .anyRequest().authenticated()	
	      
	      .and()
	      .formLogin()
	      .loginPage("/login")
	      .loginProcessingUrl("/login")
	      .successHandler(myAuthenticationSuccessHandler())
          .failureUrl("/login?error=true")
          .and()
	      .exceptionHandling()
	      .accessDeniedPage("/accessDenied")
		  
          .and()
	      //.exceptionHandling().accessDeniedPage("/logout").and()
		  
		  .logout()
          .logoutSuccessUrl("/login?logout=true")
          .deleteCookies("JSESSIONID");
    }
	
	@Autowired
	private UserDetailsService userDetailsService;
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());   
	}
	@Bean
	public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
	    return new UrlAuthenticationSuccessHandler();
	}
    @Bean
    public PasswordEncoder passwordEncoder() {
       return new BCryptPasswordEncoder();
    }

 
    

}