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

	@RequestMapping(value="joinForm")
	public void joinForm() {}
	
	@RequestMapping(value="joinResult",method=RequestMethod.GET)
	public Model joinForm(MemberDTO memberDTO, Model model) throws Exception {
//		//member_seq.nextval,#{id},#{password},#{name},#{address},#{tel},
//		//#{phone},#{email},#{birth},#{smscheck},#{emailcheck},#{membertype}
//		System.out.println("getId : "+memberDTO.getId());
//		System.out.println("getPassword : "+memberDTO.getPassword());
//		System.out.println("getName : "+memberDTO.getName());
//		System.out.println("getAddress : "+memberDTO.getAddress());
//		System.out.println("getTel : "+memberDTO.getTel());
//		System.out.println("getPhone : "+memberDTO.getPhone());
//		System.out.println("getEmail : "+memberDTO.getEmail());
//		System.out.println("getBirth : "+memberDTO.getBirth());
//		System.out.println("getSmscheck : "+memberDTO.getSmscheck());
//		System.out.println("getEmailcheck : "+memberDTO.getEmailcheck());
//		System.out.println("getMembertype : "+memberDTO.getMembertype());
//		int result = memberService.memberJoin(memberDTO);
		int result = 2;
		if(result == 1) {
			model.addAttribute("member", memberDTO).addAttribute("result", 1);
		}else {
			model.addAttribute("result", 0);
		}
		return model;
	}
}
