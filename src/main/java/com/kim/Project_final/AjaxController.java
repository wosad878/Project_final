package com.kim.Project_final;

import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kim.Project_final.Ajax.AjaxService;

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
		System.out.println(id);
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
	
}
