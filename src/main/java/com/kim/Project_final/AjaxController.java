package com.kim.Project_final;

import java.util.List;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kim.Project_final.Ajax.AjaxService;
import com.kim.Project_final.cart.CartDTO;
import com.kim.Project_final.member.MemberDTO;

@RestController
@RequestMapping(value="/ajax/**")
public class AjaxController {

	@Inject
	private AjaxService ajaxService;
	
	@RequestMapping(value="checkId",method=RequestMethod.POST)

	/*한글 보낼 때
	produces="text/plain;charset=UTF-8"*/
	
	public int checkId(String id) throws Exception {
		String memberId = "";
		String pattern = "^(?=.*?[a-z])(?=.*[0-9])[a-z0-9]{4,16}$";
		boolean b = Pattern.matches(pattern, id);
		int result = 3;
		if(b) {
			memberId = ajaxService.checkId(id);
			if(memberId == null) {
				result = 1;
			}else {
				result = 2;
			}
		}
		return result;
	}
	
	@RequestMapping(value="cartDelete", method=RequestMethod.POST)
	public int cartDelete(String[] name, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int check = 0;
		for(int i=0; i< name.length; i++) {
			System.out.println(name[i]);
			CartDTO cartDTO = new CartDTO();
			cartDTO.setId(memberDTO.getId());
			cartDTO.setProname(name[i]);
			int result = ajaxService.cartDelete(cartDTO);
			check = check +result;
		}
		if(check == name.length) {
			return 1;
		}else {
			return 0;
		}
	}
}
