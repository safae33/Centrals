package com.Config;


import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableWebMvc
@ComponentScan("com")
@EnableTransactionManagement
@Import(SecurityConfig.class)
//@PropertySource("classpath:app.properties")
public class AppConfig implements WebMvcConfigurer{

	
	private static final Logger logger = LoggerFactory.getLogger(AppConfig.class);
	@Autowired
	public AppConfig(Environment envr) {
	}
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
	
	@Bean
    public ViewResolver beanNameViewResolver() {
        BeanNameViewResolver resolver = new BeanNameViewResolver();
        return resolver;
    }
	
	@Bean
    public ViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views/");
        bean.setSuffix(".jsp");
        return bean;
    }
	
	@Bean
    public LocalSessionFactoryBean getSessionFactory() {
        logger.info("Building session factory...");

        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();

        sessionFactory.setDataSource(getApplicationDataSource());

        sessionFactory.setPackagesToScan("com.Model");

        Properties hibernateProperties = new Properties();
        hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        hibernateProperties.setProperty("hibernate.show_sql", "true");
        hibernateProperties.setProperty("hibernate.format_sql", "false");
        hibernateProperties.setProperty("hibernate.temp.use_jdbc_metadata_defaults","false");
        hibernateProperties.setProperty("hibernate.default_schema","public");

        //Caching
        hibernateProperties.setProperty("hibernate.cache.use_second_level_cache", "true");
        hibernateProperties.setProperty("hibernate.cache.use_query_cache","true");
        hibernateProperties.setProperty("hibernate.generate_statistics","false");
        hibernateProperties.setProperty("hibernate.cache.region.factory_class","infinispan");
        hibernateProperties.setProperty("hibernate.cache.infinispan.cfg","org/infinispan/hibernate/cache/commons/builder/infinispan-configs-local.xml");
        hibernateProperties.setProperty("javax.persistence.sharedCache.mode","ENABLE_SELECTIVE");

        sessionFactory.setHibernateProperties(hibernateProperties);

        logger.info("Session factory builded successfully...");

        return sessionFactory;
    }
	
	@Bean("applicationDataSource")
    public DataSource getApplicationDataSource() {
        logger.info("Initializing data source...");
        HikariDataSource ds = new HikariDataSource();
        ds.setDriverClassName("org.postgresql.Driver");
        ds.setJdbcUrl("jdbc:postgresql://localhost:5432/centrals");
        ds.setUsername("postgres");
        ds.setPassword("asd");
        ds.setConnectionTimeout(20000);
        ds.setMinimumIdle(5);
        ds.setMaximumPoolSize(20);
        ds.setIdleTimeout(300000);
        return ds;
    }
	
	@Bean
    @Autowired
    public PlatformTransactionManager getTransactionManager(SessionFactory sessionFactory) {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactory);
        return transactionManager;
    }
	
	@Bean
    public MessageSource messageSource() {
      ResourceBundleMessageSource source = new ResourceBundleMessageSource();
      source.setBasename("messages");
      return source;
    }
	
	
	
}

