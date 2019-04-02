package br.com.casadocodigo.loja.models;

import java.util.LinkedHashMap;
import java.util.Map;

public class CarrinhoCompras {

	private Map<CarrinhoItem, Integer> itens = new LinkedHashMap<CarrinhoItem, Integer>();
	
	public void add(CarrinhoItem item) {
		itens.put(item, getQuantidade(item) + 1);
	}

	private int getQuantidade(CarrinhoItem item) {
		if (itens.containsKey(item))
		return 0;
	}
	
}
