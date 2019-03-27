package br.com.casadocodigo.loja.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.model.Produto;

@Repository	//Fazendo o spring conhecer o "ProdutoDAO" para injetar no "ProdutosController", repository vai mapear o ProdutoDAO
public class ProdutoDAO {

	@PersistenceContext	//O spring coloca o entity manager aqui com a annotation
	private EntityManager manager;
	
	public void gravar(Produto produto) {	//Gravando produto com JPA
		manager.persist(produto);
	}
	
}
