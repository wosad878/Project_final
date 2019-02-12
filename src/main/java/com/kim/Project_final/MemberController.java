package com.kim.Project_final;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kim.Project_final.cart.CartDTO;
import com.kim.Project_final.cart.CartService;
import com.kim.Project_final.member.MemberDTO;
import com.kim.Project_final.member.MemberService;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private CartService cartService;
	

	@RequestMapping(value="joinForm")
	public void joinForm() {}
		
	@RequestMapping(value="joinResult")
	public void joinResult() {}
	
	@RequestMapping(value="joinResult",method=RequestMethod.POST)
	public Model joinResult(MemberDTO memberDTO, Model model) throws Exception {
		int result = memberService.memberJoin(memberDTO);
		if(result == 1) {
			model.addAttribute("member", memberDTO).addAttribute("result", 1);
		}else {
			model.addAttribute("result", 0);
		}
		return model;
	}
	
	@RequestMapping(value="loginForm",method=RequestMethod.GET)
	public void loginForm(HttpServletRequest request, HttpSession session, CartDTO cartDTO) throws Exception {
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(1024);
		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
		
		session.setAttribute("_RSA_WEB_KEY", privateKey);	//세션에 RSA 개인키를 저장
		
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec
		(publicKey, RSAPublicKeySpec.class);
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
		
		request.setAttribute("RSAModulus", publicKeyModulus);	
		//로그인 폼의 Input Hidden에 값을 세팅하기 위해
		request.setAttribute("RSAExponent", publicKeyExponent);
		//로그인 폼의 Input Hidden에 값을 세팅하기 위해
		
		
		String referer = request.getHeader("Referer");
		if(cartDTO.getProname() != null) {
			session.setAttribute("cartDTO",cartDTO);
			referer = "../cart/myCart";
		}
		if(referer == null || referer.equals("http://localhost/Project_final/member/loginForm")) {
			referer = "/index/home";
		}
		session.setAttribute("path", referer);
	}
	
	@RequestMapping(value="loginForm",method=RequestMethod.POST)
	public String loginFrom(HttpSession session, RedirectAttributes rd) throws Exception {
		String referer = (String)session.getAttribute("path");
		CartDTO cartDTO = (CartDTO)session.getAttribute("cartDTO");
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(cartDTO == null) {
			return "redirect:"+referer;
		}else {
			cartDTO.setId(memberDTO.getId());
			int check = 0;
			List<CartDTO> ar = cartService.cartSelectList(memberDTO.getId());
			for(int i=0; i< ar.size(); i++) {
				if(ar.get(i).getProname().equals(cartDTO.getProname())) {
					cartService.cartUpdate(cartDTO);
					check = 1;
					break;
				}else {
					check = 2;
				}
			}
			if(check == 2) {
				System.out.println(cartDTO.getNum());
				cartService.cartInsert(cartDTO);
			}
		}
		return "redirect:"+referer;
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index/home";
	}
	
	@RequestMapping(value="updateForm")
	public String updateForm(HttpSession session,Model model) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		StringTokenizer st = new StringTokenizer(memberDTO.getEmail(), "||");
		
		List<String> email = new ArrayList<String>();
		st = new StringTokenizer(memberDTO.getEmail(), "@");
		while(st.hasMoreTokens()) {
			email.add(st.nextToken());
		}
		
		List<String> birth = new ArrayList<String>();
		st = new StringTokenizer(memberDTO.getBirth(), "-");
		while(st.hasMoreTokens()) {
			birth.add(st.nextToken());
		}
		model.addAttribute("email", email).addAttribute("member",memberDTO).addAttribute("birth",birth);
		return "member/updateForm";
	}
	
	@RequestMapping(value="updateForm", method=RequestMethod.POST)
	public String updateForm(MemberDTO memberDTO, HttpSession session, RedirectAttributes rd) throws Exception {
		int result = memberService.memberUpdate(memberDTO);
		if(result == 1) {
			session.setAttribute("member", memberService.memberLogin(memberDTO));
			return "redirect:/index/home";
		}else {
			rd.addFlashAttribute("message", "다시 확인해주세요");
			return "redirect:/member/updateForm";
		}
	}
}
