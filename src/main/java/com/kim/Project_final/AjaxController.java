package com.kim.Project_final;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kim.Project_final.Ajax.AjaxService;

@RestController
@RequestMapping("/ajax/**")
public class AjaxController {

	@Inject
	private AjaxService ajaxService; 
	
	@RequestMapping(value="checkId",method=RequestMethod.POST)
	public String checkId(String id) throws Exception {
		String message = "사용 불가능 한 ID 입니다";
		if(id != "") {
			String dbId = ajaxService.checkId(id);
			if(dbId == null) {
				message = "사용가능 한 아이디 입니다";
			}
		}
		return message;
	}
}
