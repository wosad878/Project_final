package com.kim.Project_final.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kim.Project_final.product.ProductDAO;
import com.kim.Project_final.product.ProductDTO;

@Service
public class CartService {

	@Inject
	CartDAO cartDAO;
	@Inject
	ProductDAO productDAO;
	
	public int cartInsert(CartDTO cartDTO) throws Exception {
		return cartDAO.cartInsert(cartDTO);
	}
	public CartDTO cartSelect(CartDTO cartDTO) throws Exception {
		String name = cartDTO.getProname();
		ProductDTO productDTO = productDAO.selectOne(name);
		cartDTO = cartDAO.cartSelect(cartDTO);
		cartDTO.setProductDTO(productDTO);
		return cartDTO;
	}
	public List<CartDTO> cartSelectList(String id) throws Exception {
		List<CartDTO> ar = cartDAO.cartSelectList(id);
		for(int i=0; i< ar.size(); i++) {
			ar.get(i).setProductDTO(productDAO.selectOne(ar.get(i).getProname()));
		}
		return ar;
	}
	
	public int cartUpdate(CartDTO cartDTO) throws Exception {
		return cartDAO.cartUpdate(cartDTO);
	}
	public int cartDeleteAll(String id) throws Exception{
		return cartDAO.cartDeleteAll(id);
	}
	public int cartDeleteOne(String proname) throws Exception{
		return cartDAO.cartDeleteOne(proname);
	}
}
