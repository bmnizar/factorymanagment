
package com.factorymanagement.appConfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 * 
 */
/*
 * @author s715055
 *
 */
@Configuration
public class ApplicationConfig {
	@Bean
	public DriverManagerDataSource springSecurityDataSource() {
		System.out.println();
		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
		driverManagerDataSource.setDriverClassName(com.mysql.jdbc.Driver.class.getName());
		driverManagerDataSource.setUrl("jdbc:mysql://localhost:3306/FactoryManagmentDb");
		driverManagerDataSource.setUsername("admin");
		driverManagerDataSource.setPassword("admin");

		return driverManagerDataSource;
	}
}
