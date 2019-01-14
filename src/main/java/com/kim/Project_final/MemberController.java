package com.kim.Project_final;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kim.Project_final.member.MemberDTO;
import com.kim.Project_final.member.MemberService;


@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Inject
	private MemberService memberService;

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
	
	@RequestMapping(value="loginForm")
	public void loginForm() {}
	
	@RequestMapping(value="loginForm",method=RequestMethod.POST)
	public String loginFrom(MemberDTO memberDTO, HttpSession session, RedirectAttributes rd) throws Exception {

		memberDTO = memberService.memberLogin(memberDTO);
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
			return "redirect:/index/home";
		}else {
			rd.addFlashAttribute("message", "아이디 또는 비밀번호를 확인해주세요");
			return "redirect:/member/loginForm";
		}
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index/home";
	}
	
	@RequestMapping(value="updateForm")
	public String updateForm(HttpSession session,Model model) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		StringTokenizer st = new StringTokenizer(memberDTO.getAddress(), "||");
		
		List<String> addr = new ArrayList<String>();
		while(st.hasMoreTokens()) {
			 addr.add(st.nextToken());
		}
		
		List<String> phone = new ArrayList<String>();
		st = new StringTokenizer(memberDTO.getPhone(), "-");
		while(st.hasMoreTokens()) {
			phone.add(st.nextToken());
		}
		
		List<String> tel = new ArrayList<String>();
		if(memberDTO.getTel() != "0") {
			st = new StringTokenizer(memberDTO.getTel(), "-");
			while(st.hasMoreTokens()) {
				tel.add(st.nextToken());
			}
		}
		
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
		model.addAttribute("addr", addr).addAttribute("email", email).addAttribute("phone", phone)
		.addAttribute("tel", tel).addAttribute("member",memberDTO).addAttribute("birth",birth);
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
