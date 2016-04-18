package com.directory.appConfig;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configurers.provisioning.JdbcUserDetailsManagerConfigurer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExceptionHandlingConfigurer;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;

@Configuration
@EnableWebSecurity
public class LoginSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	DriverManagerDataSource driverManagerDataSource;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder authenticationMgr) throws Exception {
		// authenticationMgr.inMemoryAuthentication().withUser("abc").password("abc").authorities("ROLE_USER");
		JdbcUserDetailsManagerConfigurer<AuthenticationManagerBuilder> jdbcUserDetailsManagerConfigurer = authenticationMgr
				.jdbcAuthentication().dataSource(driverManagerDataSource);

		JdbcUserDetailsManagerConfigurer<AuthenticationManagerBuilder> usersByUsernameQuery = jdbcUserDetailsManagerConfigurer
				.usersByUsernameQuery("select	 username,password,enabled from application_users where username=? ");
		usersByUsernameQuery
				.authoritiesByUsernameQuery("select username ,role from application_users_roles where username=? ");
	}

	@SuppressWarnings("unused")
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry
		// authorizeRequests = http
		// .authorizeRequests();
		// ExceptionHandlingConfigurer<HttpSecurity> httpSecurity =
		// http.authorizeRequests().antMatchers("/homePage")
		// .hasRole("AdminRole").antMatchers("/humanRessourceService").hasRole("HumarRessourceServiceRole")
		// .antMatchers("/maintenanceService").hasRole("MaintenanceServiceRole").and().formLogin()
		// .loginPage("/loginPage").defaultSuccessUrl("/homePage").failureUrl("/loginPage?error")
		// .usernameParameter("username").passwordParameter("password").and()
		// .addFilterAfter(new CsrfHeaderFilter(),
		// CsrfFilter.class).logout().logoutSuccessUrl("/loginPage?logout")
		// .and().exceptionHandling().accessDeniedPage("/loginPage?error");
		http.authorizeRequests().antMatchers("/homePage").access("hasRole('AdminRole')")
				.antMatchers("/productionService").access("hasRole('ProductionServiceRole')")
				.antMatchers("/maintenanceService").access("hasRole('MaintenanceServiceRole')").and().formLogin()
				.loginPage("/loginPage").usernameParameter("username").passwordParameter("password").and().logout()
				.logoutSuccessUrl("/loginPage?logout").and().exceptionHandling().accessDeniedPage("/loginPage?error")
				.and().addFilterAfter(new CsrfHeaderFilter(), CsrfFilter.class);

		http.csrf().csrfTokenRepository(csrfTokenRepository());

	}

	/**
	 * @return
	 */
	private CsrfTokenRepository csrfTokenRepository() {
		HttpSessionCsrfTokenRepository repository = new HttpSessionCsrfTokenRepository();
		repository.setHeaderName("X-XSRF-TOKEN");
		return repository;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.security.config.annotation.web.configuration.
	 * WebSecurityConfigurerAdapter#configure(org.springframework.security.
	 * config.annotation.authentication.builders.AuthenticationManagerBuilder)
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		super.configure(auth);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.security.config.annotation.web.configuration.
	 * WebSecurityConfigurerAdapter#configure(org.springframework.security.
	 * config.annotation.web.builders.WebSecurity)
	 */
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css/**").antMatchers("/scripts/**");
		;
	}
}