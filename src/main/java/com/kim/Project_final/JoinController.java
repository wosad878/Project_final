package com.kim.Project_final;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/join/**")
public class JoinController {

	@RequestMapping(value="joinForm")
	public void joinForm() {
		
	}
}
