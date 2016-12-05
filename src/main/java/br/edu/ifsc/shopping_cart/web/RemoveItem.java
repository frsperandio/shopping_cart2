package br.edu.ifsc.shopping_cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsc.shopping_cart.dao.ProductDAO;
import br.edu.ifsc.shopping_cart.modelo.ShoppingCart;

public class RemoveItem implements Tarefa {
	
	@Override
	public String executa(HttpServletRequest req, HttpServletResponse response) {
		String commerceItemId = req.getParameter("id");
		HttpSession session = req.getSession();
		ShoppingCart shoppingCart = Util.getShoppingCart(req, response);
		shoppingCart.removeItem(commerceItemId);
		session.setAttribute("shoppingCart", shoppingCart);
		req.setAttribute("products", ProductDAO.getProducts());
		req.setAttribute("shoppingCart", shoppingCart);
		return "/WEB-INF/paginas/store.jsp";
	}
	
}