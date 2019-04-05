package br.com.casadocodigo.loja.models;

import java.math.BigDecimal;

public class DadosPagamento {

	private BigDecimal value;

	public DadosPagamento(BigDecimal value) {
		this.value = value;
	}
	
	public DadosPagamento() { //construtor sem parâmetros para necessidade futura
		
	}
	
	public BigDecimal getValue() {
		return value;
	}
}
