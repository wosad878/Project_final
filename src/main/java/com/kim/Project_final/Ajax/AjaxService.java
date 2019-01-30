package com.kim.Project_final.Ajax;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kim.Project_final.cart.CartDTO;

@Service
public class AjaxService {

	@Inject
	private AjaxDAO ajaxDAO;
	
	public String checkId(String id) throws Exception {
		return ajaxDAO.checkId(id);
	}
	public int cartDelete(CartDTO cartDTO) throws Exception {
		return ajaxDAO.cartDelete(cartDTO);
	}
}
