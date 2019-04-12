package br.com.casadocodigo.loja.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.models.Produto;
/** 
 * @author Hech
 * Primeiro CONTROLLER, página inicial
 */
@Controller 	//Spring Annotation @Controller
public class HomeController {
	
	@Autowired
	private ProdutoDAO produtoDao;
	
	@RequestMapping("/") 	//Mapeamento do request do usuário
	public ModelAndView index() {	//Retorna a página inicial do nosso projeto
		List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("produtos", produtos);
		
		return modelAndView;
	}
	
}
