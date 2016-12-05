package br.edu.ifsc.shopping_cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsc.shopping_cart.dao.UsuarioDAO;

public class AccessUsuarios implements Tarefa {
	
	@Override
	public String executa(HttpServletRequest req, HttpServletResponse response) {
		HttpSession session = req.getSession();
		if (session.getAttribute("usuarioLogado") != null) {
			req.setAttribute("usuarios", UsuarioDAO.getUsuarios());
			return "/WEB-INF/paginas/usuarios.jsp";
		}
		else {
			return "/forbidden.jsp";
		}
	}
	
}