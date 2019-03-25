package br.com.casadocodigo.loja.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/** 
 * @author Hech
 * Primeiro CONTROLLER, página inicial
 */
@Controller 	//Spring Annotation @Controller
public class HomeController {

	@RequestMapping("/") 	//Mapeamento do request do usuário
	public void index() {
		System.out.println("Entrando na home da CDC");
	}
	
}
