package br.com.casadocodigo.loja.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.casadocodigo.loja.model.Produto;

public class ProdutoDAO {

	@PersistenceContext	//O spring coloca o entity manager aqui com a annotation
	private EntityManager manager;
	
	public void gravar(Produto produto) {	//Gravando produto com JPA
		manager.persist(produto);
	}
	
}
