package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.models.CarrinhoCompras;
import br.com.casadocodigo.loja.models.DadosPagamento;

@RequestMapping("/pagamento")
@Controller
public class PagamentoController {
	
	@Autowired
	private CarrinhoCompras carrinho;
	
	private RestTemplate restTemplate;
	
	@RequestMapping(value="/finalizar", method=RequestMethod.POST)	//Aceita apenas método POST
	public ModelAndView finalizar(RedirectAttributes model) {
		String uri = "http://book-payment.herokuapp.com/payment";
		String response = restTemplate.postForObject(uri, new DadosPagamento(carrinho.getTotal()), String.class);//Realiza requisições GET e POST utilizando o protocolo httl para integrar aplicações
		System.out.println(carrinho.getTotal());
		model.addFlashAttribute("sucesso", response);
		
		return new ModelAndView("redirect:/produtos");
	}
	
	
}
