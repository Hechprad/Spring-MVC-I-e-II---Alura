package br.com.casadocodigo.loja.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import br.com.casadocodigo.loja.controllers.HomeController;

/**
 * @author Hech
 * Classe de configurações das páginas WEB
 */

@EnableWebMvc	//Spring annotation - Configurações iniciais, habilitando o uso do Spring MVC
@ComponentScan(basePackageClasses= {HomeController.class})	//Mostrando qual a classe de controle
public class AppWebConfiguration {
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver () {	//Método para setar o prefixo e o sulfixo dos endereços das páginas jsp (views)
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		
		return resolver;
	}

}
