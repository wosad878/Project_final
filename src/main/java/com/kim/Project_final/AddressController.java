package com.kim.Project_final;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kim.Project_final.address.AddressDTO;
import com.kim.Project_final.address.AddressService;
import com.kim.Project_final.member.MemberDTO;

@Controller
@RequestMapping("/address/**")
public class AddressController {

	@Inject
	private AddressService addressService;
	
	@RequestMapping("addressList")
	public void addressList(HttpSession session, Model model) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<AddressDTO> ar = addressService.selectList(memberDTO.getId());
		 model.addAttribute("list", ar);
	}
	
	@RequestMapping("addressForm")
	public void addressForm() {}
}
