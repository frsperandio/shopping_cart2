package br.edu.ifsc.shopping_cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsc.shopping_cart.dao.ProductDAO;

public class AccessStore implements Tarefa {
	
	@Override
	public String executa(HttpServletRequest req, HttpServletResponse response) {
		HttpSession session = req.getSession();
		if (session.getAttribute("usuarioLogado") != null) {
			req.setAttribute("products", ProductDAO.getProducts());
			req.setAttribute("shoppingCart", Util.getShoppingCart(req, response));
			return "/WEB-INF/paginas/store.jsp";
		}
		else {
			return "/forbidden.jsp";
		}
	}
	
}