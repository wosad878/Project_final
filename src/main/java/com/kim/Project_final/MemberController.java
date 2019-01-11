package com.kim.Project_final;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kim.Project_final.member.MemberDTO;
import com.kim.Project_final.member.MemberService;


@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="loginForm")
	public void loginForm() {}

	@RequestMapping(value="joinForm")
	public void joinForm() {}
	
	@RequestMapping(value="joinResult",method=RequestMethod.POST)
	public Model joinForm(MemberDTO memberDTO, Model model) throws Exception {
		int result = memberService.memberJoin(memberDTO);
		if(result == 1) {
			model.addAttribute("member", memberDTO).addAttribute("result", 1);
		}else {
			model.addAttribute("result", 0);
		}
		return model;
	}
}
