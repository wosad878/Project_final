package com.kim.Project_final;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/juso/**")
public class JusoController {

	@RequestMapping("jusoPopup")
	public void josuPopup() {}
}
