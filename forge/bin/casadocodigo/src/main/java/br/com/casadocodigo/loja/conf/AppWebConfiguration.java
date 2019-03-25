package br.com.casadocodigo.loja.conf;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import br.com.casadocodigo.loja.controllers.HomeController;

/**
 * @author Hech
 *
 */

@EnableWebMvc	//Spring annotation - Configurações iniciais, habilitando o uso do Spring MVC
@ComponentScan(basePackageClasses= {HomeController.class})	//Mostrando qual a classe de controle
public class AppWebConfiguration {

}
