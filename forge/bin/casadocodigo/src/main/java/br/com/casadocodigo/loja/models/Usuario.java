package br.com.casadocodigo.loja.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Usuario {

	@Id
	private String email;
	
private String senha;
	
	private String nome;
	
	private List<Role> permissoes = new ArrayList<Role>();
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Role> getPermissoes() {
		return permissoes;
	}

	public void setPermissoes(List<Role> permissoes) {
		this.permissoes = permissoes;
	}
}
