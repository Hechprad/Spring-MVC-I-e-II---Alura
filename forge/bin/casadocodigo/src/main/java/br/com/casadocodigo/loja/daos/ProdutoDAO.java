package br.com.casadocodigo.loja.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;
/**
 * 
 * @author Hech
 * Classe para acesso ao Banco de Dados do produto
 */
@Repository	//Fazendo o spring conhecer o "ProdutoDAO" para injetar no "ProdutosController", repository vai mapear o ProdutoDAO
@Transactional
public class ProdutoDAO {

	@PersistenceContext	//O spring coloca o entity manager aqui com a annotation
	private EntityManager manager;
	
	public void gravar(Produto produto) {	//Gravando produto com JPA
		manager.persist(produto);
	}

	public List<Produto> listar() {
		return manager.createQuery("select distinct(p) from Produto p join fetch p.precos", Produto.class)
				.getResultList();
		/**
		 * "select distinct(p) from Produto p join fetch p.precos"
		 * 'distinct' faz com que o resultado venha apenas uma vez, e não três ves por ter três tipos de preço
		 * join fetch faz o carregamento dos preços no momento que vc está fazendo a busca dos produtos.
		 * consulta no banco de dados que carrega os produtos, para que também carregue junto com estes, seus preços.
		 */
	}
	
	public Produto find(Integer id) {
		return manager.createQuery("select distinct(p) from Produto p "
				+ "join fetch p.precos preco where p.id = :id", Produto.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	
	public BigDecimal somaPrecosPorTipo(TipoPreco tipoPreco) {
		TypedQuery<BigDecimal> query = manager
				.createQuery("select sum(preco.valor) from Produto p"
						+ " join p.precos preco where preco.tipo = :tipoPreco", BigDecimal.class);
		query.setParameter("tipoPreco", tipoPreco);
		
		return query.getSingleResult();
	}
}
