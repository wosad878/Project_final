package com.kim.Project_final;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kim.Project_final.cart.CartDTO;
import com.kim.Project_final.cart.CartService;
import com.kim.Project_final.member.MemberDTO;
import com.kim.Project_final.product.ProductDTO;
import com.kim.Project_final.product.ProductService;

@Controller
@RequestMapping("/order/")
public class OrderController {

	@Inject
	CartService cartService;
	@Inject
	ProductService productService;
	
	@RequestMapping(value="orderBoard", method=RequestMethod.GET)
	public void oreder(@RequestParam(required=false)String[] ary,HttpSession session, Model model, @ModelAttribute()CartDTO cartDTO) throws Exception {
		List<CartDTO> ar;
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(ary != null) {
			System.out.println(1);
			ar = new ArrayList<CartDTO>();
			for(int i=0; i<ary.length; i++) {
				cartDTO = new CartDTO();
				cartDTO.setId(memberDTO.getId());
				cartDTO.setProname(ary[i].toString());
				cartDTO = cartService.cartSelect(cartDTO);
				ar.add(cartDTO);
			}
		}else if(cartDTO.getProname() != null) {
			System.out.println(2);
			ar = new ArrayList<CartDTO>();
			cartDTO.setId(memberDTO.getId());
			if(cartService.cartSelect(cartDTO) == null) {
				cartService.cartInsert(cartDTO);
			}
			if(cartService.cartSelect(cartDTO).getQuantity() != cartDTO.getQuantity()) {
				cartService.cartUpdate(cartDTO);
			}
			cartDTO = cartService.cartSelect(cartDTO);
			ar.add(cartDTO);
		}else {
			System.out.println(3);
			ar = cartService.cartSelectList(memberDTO.getId());
		}
		model.addAttribute("cartList",ar);
	}
	
	
}
