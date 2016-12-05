package br.edu.ifsc.shopping_cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsc.shopping_cart.dao.ProductDAO;
import br.edu.ifsc.shopping_cart.dao.UsuarioDAO;
import br.edu.ifsc.shopping_cart.modelo.Usuario;

public class AddUsuario implements Tarefa {
	
	@Override
	public String executa(HttpServletRequest req, HttpServletResponse response) {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			Usuario usuario = new Usuario(email, password);
			UsuarioDAO.addUsuario(usuario);
			HttpSession session = req.getSession();
			req.setAttribute("usuarios", UsuarioDAO.getUsuarios());
			session.setAttribute("usuarioLogado", usuario);
			req.setAttribute("products", ProductDAO.getProducts());
			req.setAttribute("shoppingCart", Util.getShoppingCart(req, response));
			return "/WEB-INF/paginas/usuarios.jsp";
		} catch (IllegalArgumentException e) {
			req.setAttribute("illegalArgumentException", true);
			return "/novoUsuario.jsp";
		} catch (Exception e) {
			req.setAttribute("exception", true);
			return "/novoUsuario.jsp";
		}
	}
}