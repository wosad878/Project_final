package com.kim.Project_final;

import java.security.PrivateKey;
import java.util.regex.Pattern;

import javax.crypto.Cipher;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kim.Project_final.Ajax.AjaxService;
import com.kim.Project_final.cart.CartDTO;
import com.kim.Project_final.member.MemberDTO;
import com.kim.Project_final.member.MemberService;

@RestController
@RequestMapping(value="/ajax/**")
public class AjaxController {

	@Inject
	private AjaxService ajaxService;
	@Inject
	private MemberService memberService;
	/*한글 보낼 때
	produces="text/plain;charset=UTF-8"*/
	
	public String decryptRsa(PrivateKey privateKey, String securedValue) {
		String decryptedValue = "";
		try {
			Cipher cipher = Cipher.getInstance("RSA");
			/**
			* 암호화 된 값은 byte 배열이다.
			* 이를 문자열 폼으로 전송하기 위해 16진 문자열(hex)로 변경한다. 
			* 서버측에서도 값을 받을 때 hex 문자열을 받아서 이를 다시 byte 배열로 바꾼 뒤에 복호화 과정을 수행한다.
			*/
			byte[] encryptedBytes = hexToByteArray(securedValue);
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
			decryptedValue = new String(decryptedBytes, "utf-8");	//문자 인코딩 주의
		} catch (Exception e) {
			e.printStackTrace();
		}
		return decryptedValue;
	}
//	16진 문자열을 byte 배열로 변환한다.
	public static byte[] hexToByteArray(String hex) {
		if(hex == null || hex.length() % 2 != 0) {
			return new byte[] {};
		}
		byte[] bytes = new byte[hex.length() / 2];
		for(int i = 0; i < hex.length(); i +=2) {
			byte value = (byte)Integer.parseInt(hex.substring(i,  i + 2), 16);
			bytes[(int) Math.floor(i/2)] = value;
		}
		return bytes;
	}
//	로그인체크
	@RequestMapping(value="login_proc",method= RequestMethod.POST)
	public JSONObject longinChk(HttpServletRequest request) {
		JSONObject listObj = new JSONObject();
		String uid = request.getParameter("user_id");
		String pwd = request.getParameter("user_pwd");
		HttpSession session = request.getSession();
		
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_KEY");
		//로그인 전에 세션에 저장된 개인키를 가져온다.
		if(privateKey == null) {
			listObj.put("state", "false");
		}else {
			try {
				//암호화 처리된 사용자 계정정보를 복호화 처리한다.
				String _uid = decryptRsa(privateKey, uid);
				String _pwd = decryptRsa(privateKey, pwd);
				//복호화 처리된 계정정보를 map에 담아서 myBatis와 연동한다.
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setId(_uid);
				memberDTO.setPassword(_pwd);
				memberDTO = ajaxService.loginChk(memberDTO);
				if(memberDTO.getName() != null) {
					listObj.put("state", "true");
					session.setAttribute("member", memberDTO);
				}
			} catch (Exception e) {
				listObj.put("state", "false");
			}
		}
		return listObj;
	}
	
	@RequestMapping(value="checkId",method=RequestMethod.POST)
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
