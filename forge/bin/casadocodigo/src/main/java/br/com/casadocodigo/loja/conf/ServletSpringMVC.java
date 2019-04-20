package br.com.casadocodigo.loja.conf;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * @author Hech
 * Classe para mostrar ao servidor que o SPRING vai atender as requisições
 * - Configurações básicas
 */
public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {SecurityConfiguration.class, 
				AppWebConfiguration.class, JPAConfiguration.class};	//Retorna a classe de 
		//configuração para o reconhecimento do Spring após implementar o login e senha de usuário
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {};	//Retorna a classe de configuração para o reconhecimento do Spring
	}

	@Override
	protected String[] getServletMappings() {	//Mapear o servlet do spring, retorna um array spring
		return new String[] {"/"}; 	//Mapeando a url "/"
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		
		return new Filter[] {encodingFilter};
	}
	
	@Override
	protected void customizeRegistration(Dynamic registration) {
		registration.setMultipartConfig(new MultipartConfigElement(""));
	}
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
	    super.onStartup(servletContext);
	    servletContext.addListener(new RequestContextListener());
	    servletContext.setInitParameter("spring.profiles.active", "dev");
	}
}
