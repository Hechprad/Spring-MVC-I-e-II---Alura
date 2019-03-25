package br.com.casadocodigo.loja.conf;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * @author Hech
 * Classe para mostrar ao servidor que o SPRING vai atender as requisições
 * - Configurações básicas
 */
public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {AppWebConfiguration.class};	//Retorna a classe de configuração para o reconhecimento do Spring
	}

	@Override
	protected String[] getServletMappings() {	//Mapear o servlet do spring, retorna um array spring
		return new String[] {"/"}; 	//Mapeando a url "/"
	}

	
	
}
