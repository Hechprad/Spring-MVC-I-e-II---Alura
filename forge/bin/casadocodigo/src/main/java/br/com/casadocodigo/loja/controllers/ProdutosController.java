package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.models.Produto;

@Controller
public class ProdutosController {

	@Autowired	//Injeção de dependências - Spring Injeta. @AutoWired indica ao Spring que o objeto anotado é um Bean dele e que queremos que ele nos dê uma instância por meio do recurso de injeção de dependência.
	private ProdutoDAO produtoDao;
	
	@RequestMapping("/produtos/form")
	public String form() {
		return "produtos/form";
	}
	
	@RequestMapping("/produtos")
	public String gravar(Produto produto) {	//Recebe objeto produto do form.jsp de cadastro
		System.out.println(produto.toString());
		produtoDao.gravar(produto);	//persistindo o produto no banco
		return "produtos/ok";
	}
	
}
