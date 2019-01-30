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
import com.kim.Project_final.product.ProductService;

@Controller
@RequestMapping("/cart/")
public class CartController {
	@Inject
	private CartService cartService;
	@Inject
	private ProductService productService;
	
	@RequestMapping("myCart")
	public void myCart(HttpSession session, Model model) throws Exception {
		MemberDTO memberDTO  = (MemberDTO)session.getAttribute("member");
		List<CartDTO> ar = cartService.cartSelectList(memberDTO.getId());
		for(int i =0; i< ar.size(); i++) {
			ar.get(i).setProductDTO((productService.selectOne(ar.get(i).getProname())));
		}
		model.addAttribute("cartList", ar);
	}
	
	@RequestMapping(value="cartInsert", method=RequestMethod.POST)
	public String cartInsert(CartDTO cartDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		cartDTO.setId(memberDTO.getId());
		List<CartDTO> ar = cartService.cartSelectList(memberDTO.getId());
		int count = 0;
		for(CartDTO c : ar) {
			if(c.getProname().equals(cartDTO.getProname())) {
				count++;
			}
		}
		if(count == 0) {
			cartService.cartInsert(cartDTO);
		}else {
			cartService.cartUpdate(cartDTO);
		}
		return "redirect:./myCart";
	}
	
	@RequestMapping(value="cartUpdate", method=RequestMethod.POST)
	public String cartUpdate(HttpSession session, CartDTO cartDTO) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		cartDTO.setId(memberDTO.getId());
		cartService.cartUpdate(cartDTO);
		return "redirect:./myCart";
	}
	
	@RequestMapping("cartDeleteAll")
	public String cartDeleteAll(HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		cartService.cartDeleteAll(memberDTO.getId());
		return "redirect:./myCart";
	}
	
	@RequestMapping("cartDeleteSelect")
	public String cartDeleteSelect(String[] ary) throws Exception {
		for(int i=0; i<ary.length; i++) {
			cartService.cartDeleteOne(ary[i]);	
		}
		return "redirect:./myCart";
	}
	@RequestMapping("cartDeleteOne")
	public String cartDeleteOne(String proname) throws Exception {
			cartService.cartDeleteOne(proname);	
		return "redirect:./myCart";
	}
	
}
