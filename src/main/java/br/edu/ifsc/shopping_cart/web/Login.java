package br.edu.ifsc.shopping_cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsc.shopping_cart.dao.ProductDAO;
import br.edu.ifsc.shopping_cart.dao.UsuarioDAO;
import br.edu.ifsc.shopping_cart.modelo.Usuario;

public class Login implements Tarefa {
	
	public Login() {
		System.out.println("Construindo uma servlet do tipo BuscaEmpresa " + this);
	}
	
	@Override
	public String executa(HttpServletRequest req, HttpServletResponse response) {
		String email = req.getParameter("email");
		String senha = req.getParameter("senha");
		Usuario usuario = new UsuarioDAO().buscaPorEmailESenha(email, senha);
		if (usuario == null) {
			req.setAttribute("usuarioNaoEncontrado", true);
			return "/index.jsp";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("usuarioLogado", usuario);
			req.setAttribute("products", ProductDAO.getProducts());
			req.setAttribute("shoppingCart", Util.getShoppingCart(req, response));
			return "/WEB-INF/paginas/store.jsp";
		}
	}

}