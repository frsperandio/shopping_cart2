package br.edu.ifsc.shopping_cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logout implements Tarefa {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().removeAttribute("usuarioLogado");
		req.getSession().removeAttribute("shoppingCart");
		return "/index.jsp";
	}

}
