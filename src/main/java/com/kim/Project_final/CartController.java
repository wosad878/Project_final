package com.kim.Project_final;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kim.Project_final.cart.CartDTO;
import com.kim.Project_final.cart.CartService;
import com.kim.Project_final.member.MemberDTO;

@Controller
@RequestMapping("/cart/")
public class CartController {
	@Inject
	private CartService cartService;
	
	@RequestMapping("myCart")
	public void myCart(HttpSession session, Model model) throws Exception {
		MemberDTO memberDTO  = (MemberDTO)session.getAttribute("member");
		List<CartDTO> ar = cartService.cartSelectList(memberDTO.getId());
		model.addAttribute("cartList", ar);
	}
	
	@RequestMapping(value="cartInsert", method=RequestMethod.POST)
	public String cartInsert(CartDTO cartDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		cartDTO.setId(memberDTO.getId());
		if(cartService.cartSelect(cartDTO) == null) {
			cartService.cartInsert(cartDTO);
		}else {
			cartService.cartUpdate(cartDTO);
		}
		return "redirect:./myCart";
	}
}
