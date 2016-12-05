package br.edu.ifsc.shopping_cart.dao;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.edu.ifsc.shopping_cart.modelo.CommerceItem;
import br.edu.ifsc.shopping_cart.modelo.Product;
import br.edu.ifsc.shopping_cart.modelo.Usuario;

public class UsuarioDAO {

	private final static Map<String, Usuario> USUARIOS = new HashMap<>();
	static {
		USUARIOS.put("professor@sematecsolucoes.com.br", new Usuario("professor@sematecsolucoes.com.br","professor"));
		USUARIOS.put("diretor@sematecsolucoes.com.br", new Usuario("diretor@sematecsolucoes.com.br","diretor"));
	}

	public Usuario buscaPorEmailESenha(String email, String senha) {
		if (!USUARIOS.containsKey(email))
			return null;

		Usuario usuario = USUARIOS.get(email);
		if (usuario.getSenha().equals(senha))
			return usuario;
		
		return null;
	}
	
	public static Collection<Usuario> getUsuarios() {
		return USUARIOS.values();
	}
	
	public static void addUsuario(Usuario usuario) {
		if(!USUARIOS.containsKey(usuario.getEmail())) {
			USUARIOS.put(usuario.getEmail(), usuario);
		}
		else {
			throw new IllegalArgumentException();
		}
	}
}
