package com.kim.Project_final;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kim.Project_final.member.MemberDTO;
import com.kim.Project_final.member.MemberService;


@Controller
@RequestMapping("/join/**")
public class JoinController {
	
	@Inject
	private MemberService memberService;

	@RequestMapping(value="joinForm")
	public void joinForm() {}
	
	@RequestMapping(value="joinForm",method=RequestMethod.POST)
	public void joinForm(MemberDTO memberDTO) {
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPassword());
		System.out.println(memberDTO.getName());
		System.out.println(memberDTO.getAddress());
		System.out.println(memberDTO.getTel());
		System.out.println(memberDTO.getPhone());
		System.out.println(memberDTO.getBirth());
		System.out.println(memberDTO.getSmscheck());
		System.out.println(memberDTO.getEmailcheck());
		
	}
}
