package br.com.casadocodigo.loja.controllers;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.models.CarrinhoCompras;
import br.com.casadocodigo.loja.models.DadosPagamento;
import br.com.casadocodigo.loja.models.Usuario;

@RequestMapping("/pagamento")
@Controller
public class PagamentoController {
	
	@Autowired
	private CarrinhoCompras carrinho;
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private MailSender sender;
	
	//Callable faz com que a requisição do usuário que está pagando se torne assíncrona e apenas ele aguarde pela resposta
	@RequestMapping(value="/finalizar", method=RequestMethod.POST)	//Aceita apenas método POST
	public Callable<ModelAndView> finalizar(@AuthenticationPrincipal Usuario usuario, RedirectAttributes model) {
		//Referenciando a classe anônima com java 8 no return()
		return () -> {
		
			String uri = "http://book-payment.herokuapp.com/payment";
			
			try {
				String response = restTemplate.postForObject(uri, new DadosPagamento(carrinho.getTotal()), String.class);//Realiza requisições GET e POST utilizando o protocolo httl para integrar aplicações
				enviaEmailCompraProduto(usuario);
				model.addFlashAttribute("sucesso", response);
				System.out.println(response);
				carrinho.limpaCarrinho();
				System.out.println("Carrinho de Compras LIMPO");
				return new ModelAndView("redirect:/produtos");
			} catch (HttpClientErrorException e) {
				e.printStackTrace();
				model.addFlashAttribute("falha", "Valor maior que o permitido!! Pagamento NÃO realizado");
				return new ModelAndView("redirect:/produtos");
			}
		};
	}

	private void enviaEmailCompraProduto(Usuario usuario) {
		SimpleMailMessage email = new SimpleMailMessage();
		email.setSubject("Compra finalizada com sucesso");
		//email.setTo(usuario.getEmail());
		email.setTo("cliente@email.com");	//email do cliente, na linha acima pega o email do cadastro do cliente
		email.setText("Compra aprovada com sucesso no valor de: " + carrinho.getTotal());
		email.setFrom("equipe_de_vendas@casadocodigo.com.br");	//setFrom
		
		sender.send(email);
	}
	
}
