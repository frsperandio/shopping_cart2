package br.edu.ifsc.shopping_cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsc.shopping_cart.modelo.ShoppingCart;

public class Util {
	
	public static ShoppingCart getShoppingCart(HttpServletRequest req, HttpServletResponse response) {
		HttpSession session = req.getSession();
		ShoppingCart shoppingCart = (ShoppingCart)session.getAttribute("shoppingCart");
		if(shoppingCart == null)
			shoppingCart = new ShoppingCart();
		return shoppingCart;		
	}
	
}
