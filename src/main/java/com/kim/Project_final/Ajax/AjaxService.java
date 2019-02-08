package com.kim.Project_final.Ajax;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kim.Project_final.cart.CartDTO;
import com.kim.Project_final.member.MemberDAO;
import com.kim.Project_final.member.MemberDTO;

@Service
public class AjaxService {

	@Inject
	private AjaxDAO ajaxDAO;
	@Inject
	private MemberDAO memberDAO;
	
	public String checkId(String id) throws Exception {
		return ajaxDAO.checkId(id);
	}
	public int cartDelete(CartDTO cartDTO) throws Exception {
		return ajaxDAO.cartDelete(cartDTO);
	}
	public MemberDTO loginChk(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberLogin(memberDTO);
	}
}
