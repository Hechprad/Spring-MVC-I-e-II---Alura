package br.com.casadocodigo.loja.conf;

import java.util.concurrent.TimeUnit;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.cache.guava.GuavaCacheManager;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.format.datetime.DateFormatterRegistrar;
import org.springframework.format.support.DefaultFormattingConversionService;
import org.springframework.format.support.FormattingConversionService;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.google.common.cache.CacheBuilder;

import br.com.casadocodigo.loja.controllers.HomeController;
import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.CarrinhoCompras;

/**
 * @author Hech
 * Classe de configurações das páginas WEB
 */

@EnableWebMvc	//Spring annotation - Configurações iniciais, habilitando o uso do Spring MVC
@ComponentScan(basePackageClasses= {HomeController.class, 
		ProdutoDAO.class, FileSaver.class, CarrinhoCompras.class})	//Mostrando quais as classes de controle
@EnableCaching //habilitando o cache na aplicação
public class AppWebConfiguration extends WebMvcConfigurerAdapter {
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver () {	//Método para setar o prefixo e o sulfixo dos endereços das páginas jsp (views)
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		
		resolver.setExposedContextBeanNames("carrinhoCompras"); //O bean "CarrinhoCompras.class" fica disponível como atributo na aplicação
		
		return resolver;
	}

	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource 
			= new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("WEB-INF/message");
		messageSource.setDefaultEncoding("UTF-8");
		messageSource.setCacheSeconds(1);
		
		return messageSource;
	}
	
	//método para formatar as variáveis do tipo Calendar/data
	@Bean
	public FormattingConversionService mvcConversionService() {
		DefaultFormattingConversionService conversionService 
			= new DefaultFormattingConversionService();
		DateFormatterRegistrar registrar = new DateFormatterRegistrar();
		registrar.setFormatter(new DateFormatter("dd/MM/yyyy"));
		registrar.registerFormatters(conversionService);
		
		return conversionService;
	}
	
	//Resolver de arquivos multi-formatos
	@Bean
	public MultipartResolver multipartResolver() {
	    return new StandardServletMultipartResolver();
	}
	
	@Override //Para localizar a pasta com css resources
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	  registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}
	
	//gerente de cache, prove o cache
	@Bean
	public CacheManager cacheManager() {
		CacheBuilder<Object, Object> builder = CacheBuilder.newBuilder()
			.maximumSize(100)
			.expireAfterAccess(5, TimeUnit.MINUTES);
		GuavaCacheManager manager = new GuavaCacheManager();
		manager.setCacheBuilder(builder);
		
		return manager;
	}
}
