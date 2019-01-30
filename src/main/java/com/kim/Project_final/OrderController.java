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
			ar = new ArrayList<CartDTO>();
			for(int i=0; i<ary.length; i++) {
				cartDTO = new CartDTO();
				cartDTO.setId(memberDTO.getId());
				cartDTO.setProname(ary[i].toString());
				cartDTO = cartService.cartSelect(cartDTO);
				ar.add(cartDTO);
			}
		}else if(cartDTO.getProname() != null) {
			ar = new ArrayList<CartDTO>();
			cartDTO.setId(memberDTO.getId());
			List<CartDTO> ar2 = cartService.cartSelectList(memberDTO.getId());
			int count = 0;
			for(CartDTO c : ar2) {
				if(c.getProname().equals(cartDTO.getProname())) {
					count++;
				}
			}
			if(count == 0) {
				cartService.cartInsert(cartDTO);
			}else {
				cartService.cartUpdate(cartDTO);
			}
			cartDTO = cartService.cartSelect(cartDTO);
			ar.add(cartDTO);
		}else {
			ar = cartService.cartSelectList(memberDTO.getId());
		}
		model.addAttribute("cartList",ar);
	}
	
	
}
