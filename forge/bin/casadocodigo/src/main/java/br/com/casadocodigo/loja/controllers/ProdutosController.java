package br.com.casadocodigo.loja.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;

@Controller
@RequestMapping("produtos") // Todos os métodos desta classe pegam produto
public class ProdutosController {

	@Autowired	//Injeção de dependências - Spring Injeta. @AutoWired indica ao Spring que o objeto anotado é um Bean dele e que queremos que ele nos dê uma instância por meio do recurso de injeção de dependência.
	private ProdutoDAO produtoDao;
	
	@RequestMapping("/form")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("produtos/form");	//objeto do Spring, usamos no lugar do request
		modelAndView.addObject("tipos", TipoPreco.values());
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String gravar(Produto produto) {	//Recebe objeto produto do form.jsp de cadastro
		System.out.println(produto.toString());
		System.out.println(produto.getPrecos().toString());
		produtoDao.gravar(produto);	//persistindo o produto no banco
		return "produtos/ok";
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar() {
		List<Produto> produtos = produtoDao.listar();
		//System.out.println(produtos.toString());
		ModelAndView modelAndView = new ModelAndView("produtos/lista");
		modelAndView.addObject("produtos", produtos);
		
		return modelAndView;
	}
	
}
