package br.com.casadocodigo.loja.daos;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.util.Assert;

import br.com.casadocodigo.loja.builders.ProdutoBuilder;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;
/**
 * Classe de teste para gerear o relatório no somaPrecosPorTipo
 * @author Hech
 *
 */
public class ProdutoDAOTest {

	public void deveSomarTodosPrecosPorTipoLivro() {
		ProdutoDAO produtoDAO = new ProdutoDAO();
		
		List<Produto> livrosImpressos = ProdutoBuilder
				.newProduto(TipoPreco.IMPRESSO, BigDecimal.TEN)
				.more(3).buildAll();
		List<Produto> livrosEbooks = ProdutoBuilder
				.newProduto(TipoPreco.EBOOK, BigDecimal.TEN)
				.more(3).buildAll();
		List<Produto> livrosCombo = ProdutoBuilder
				.newProduto(TipoPreco.COMBO, BigDecimal.TEN)
				.more(3).buildAll();
		
		livrosImpressos.stream().forEach(produtoDAO::gravar);
		livrosEbooks.stream().forEach(produtoDAO::gravar);
		livrosCombo.stream().forEach(produtoDAO::gravar);
		
		
		BigDecimal valor1 = produtoDAO.somaPrecosPorTipo(TipoPreco.IMPRESSO);
		Assert.equals();
		BigDecimal valor2 = produtoDAO.somaPrecosPorTipo(TipoPreco.EBOOK);
		
		BigDecimal valor3 = produtoDAO.somaPrecosPorTipo(TipoPreco.COMBO);
		
		
	}
}
