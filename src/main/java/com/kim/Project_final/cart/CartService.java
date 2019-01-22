package com.kim.Project_final.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Inject
	CartDAO cartDAO;
	
	public int cartInsert(CartDTO cartDTO) throws Exception {
		return cartDAO.cartInsert(cartDTO);
	}
	public CartDTO cartSelect(CartDTO cartDTO) throws Exception {
		return cartDAO.cartSelect(cartDTO);
	}
	public List<CartDTO> cartSelectList(String id) throws Exception {
		return cartDAO.cartSelectList(id);
	}
	public int cartUpdate(CartDTO cartDTO) throws Exception {
		return cartDAO.cartUpdate(cartDTO);
	}
}
