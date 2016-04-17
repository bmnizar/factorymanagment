
package com.directory.appConfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 * @author BMN(BM.NIZAR) s71055
 */
/**
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
		driverManagerDataSource.setUrl("jdbc:mysql://localhost/FactoryManagmentDb");
		driverManagerDataSource.setUsername("admin");
		driverManagerDataSource.setPassword("admin");

		return driverManagerDataSource;
	}
}
