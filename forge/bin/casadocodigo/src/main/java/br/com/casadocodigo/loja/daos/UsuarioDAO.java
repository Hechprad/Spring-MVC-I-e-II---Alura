package br.com.casadocodigo.loja.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Usuario;

/**
 * 
 * @author Hech
 * Classe para acesso ao Banco de Dados do usuário
 */
@Repository
public class UsuarioDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public Usuario find(String email) {
		List<Usuario> usuarios = manager.createQuery("select u from Usuario where u.email = :email",
				Usuario.class)
			.setParameter("email", email)
			.getResultList();
		
		if(usuarios.isEmpty()) {
			throw new RuntimeException("Usuário " + email + " não foi encontrado");
		}
		
		return usuarios.get(0);
	}
}
