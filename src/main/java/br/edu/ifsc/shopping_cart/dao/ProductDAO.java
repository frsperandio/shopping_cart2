package br.edu.ifsc.shopping_cart.dao;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.edu.ifsc.shopping_cart.modelo.Product;

public class ProductDAO {
	private final static Map<String, Product> PRODUCTS = new HashMap<>();
	static {
		PRODUCTS.put("1", new Product("1", "Produto 1", "https://s7d5.scene7.com/is/image/Specialized/165459?$Display$", new BigDecimal(1000.0)));
		PRODUCTS.put("2", new Product("2", "Produto 2", "https://s7d5.scene7.com/is/image/Specialized/165476?$Display$", new BigDecimal(750.0)));
		PRODUCTS.put("3", new Product("3", "Produto 3", "https://s7d5.scene7.com/is/image/Specialized/165480?$Display$", new BigDecimal(500.0)));
	}

	public static Collection<Product> getProducts() {
		return PRODUCTS.values();
	}
	
	public static Product getProductById(String productId) {
		return PRODUCTS.get(productId);
	}
}
