package com.kim.Project_final;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kim.Project_final.cart.CartDTO;
import com.kim.Project_final.cart.CartService;
import com.kim.Project_final.member.MemberDTO;

@Controller
@RequestMapping("/order/")
public class OrderController {

	@Inject
	CartService cartService;
	
	@RequestMapping(value="orderBoard", method=RequestMethod.POST)
	public void order(CartDTO cartDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		cartDTO.setId(memberDTO.getId());
		if(cartService.cartSelect(cartDTO) == null) {
			cartService.cartInsert(cartDTO);
		}
		
	}
}
