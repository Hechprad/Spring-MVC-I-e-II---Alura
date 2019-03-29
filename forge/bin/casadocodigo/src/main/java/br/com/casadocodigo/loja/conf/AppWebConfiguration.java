package br.com.casadocodigo.loja.conf;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import br.com.casadocodigo.loja.controllers.HomeController;
import br.com.casadocodigo.loja.daos.ProdutoDAO;

/**
 * @author Hech
 * Classe de configurações das páginas WEB
 */

@EnableWebMvc	//Spring annotation - Configurações iniciais, habilitando o uso do Spring MVC
@ComponentScan(basePackageClasses= {HomeController.class, ProdutoDAO.class})	//Mostrando quais as classes de controle
public class AppWebConfiguration {
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver () {	//Método para setar o prefixo e o sulfixo dos endereços das páginas jsp (views)
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		
		return resolver;
	}

	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource 
			= new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("WEB-INF/message");
		messageSource.setDefaultEncoding("UTF-8");
		messageSource.setCacheSeconds(10);
		
		return messageSource;
	}
}
