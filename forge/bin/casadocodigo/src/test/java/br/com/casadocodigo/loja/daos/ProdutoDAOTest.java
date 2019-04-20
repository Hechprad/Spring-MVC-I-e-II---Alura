package br.com.casadocodigo.loja.daos;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import br.com.casadocodigo.loja.builders.ProdutoBuilder;
import br.com.casadocodigo.loja.conf.DataSourceConfigurationTest;
import br.com.casadocodigo.loja.conf.JPAConfiguration;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;
import junit.framework.Assert;
/**
 * Classe de teste para gerear o relatório no somaPrecosPorTipo
 * @author Hech
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes= {JPAConfiguration.class, 
		ProdutoDAO.class, DataSourceConfigurationTest.class})
@ActiveProfiles("test")
public class ProdutoDAOTest {

	@Autowired
	private ProdutoDAO produtoDao;
	
	@Test
	@Transactional
	public void deveSomarTodosPrecosPorTipoLivro() {
		List<Produto> livrosImpressos = ProdutoBuilder
				.newProduto(TipoPreco.IMPRESSO, BigDecimal.TEN)
				.more(3).buildAll();
		List<Produto> livrosEbooks = ProdutoBuilder
				.newProduto(TipoPreco.EBOOK, BigDecimal.TEN)
				.more(3).buildAll();
		List<Produto> livrosCombo = ProdutoBuilder
				.newProduto(TipoPreco.COMBO, BigDecimal.TEN)
				.more(3).buildAll();
		
		livrosImpressos.stream().forEach(produtoDao::gravar);
		livrosEbooks.stream().forEach(produtoDao::gravar);
		livrosCombo.stream().forEach(produtoDao::gravar);
		
		
		BigDecimal valor1 = produtoDao.somaPrecosPorTipo(TipoPreco.IMPRESSO);
		Assert.assertEquals(new BigDecimal(40).setScale(2), valor1);
		
		BigDecimal valor2 = produtoDao.somaPrecosPorTipo(TipoPreco.EBOOK);
		Assert.assertEquals(new BigDecimal(40).setScale(2), valor2);
		
		BigDecimal valor3 = produtoDao.somaPrecosPorTipo(TipoPreco.COMBO);
		Assert.assertEquals(new BigDecimal(40).setScale(2), valor3);
		
		
	}
}
