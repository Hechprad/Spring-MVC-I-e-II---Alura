package br.com.casadocodigo.loja.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
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
	@Cacheable(value="produtosHome")	//cacheando o método, guardando em memória para aumetar a performance
	public ModelAndView index() {	//Retorna a página inicial do nosso projeto
		List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("produtos", produtos);
		
		return modelAndView;
	}
			
//	@Autowired
//	private UsuarioDAO usuarioDao;
	
//método para cadastrar automaticamente um user admin no banco do heroku
//	@Transactional
//	@ResponseBody
//	@RequestMapping("/url-magica-maluca-asbdjabsdjhsajeruwygeiu232ewmn")
//	public String urlMagicaMaluca() {
//		Usuario usuario = new Usuario();
//		usuario.setNome("Admin");
//		usuario.setEmail("admin@casadocodigo.com.br");
//	    usuario.setSenha("$2a$10$lt7pS7Kxxe5JfP.vjLNSyOXP11eHgh7RoPxo5fvvbMCZkCUss2DGu");
//	    usuario.setRoles(Arrays.asList(new Role("ROLE_ADMIN")));
//	    
//		usuarioDao.gravar(usuario);
//		
//		return "Url Mágica Executada";
//	}
}
