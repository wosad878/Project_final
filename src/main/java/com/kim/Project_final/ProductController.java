package com.kim.Project_final;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	
	@RequestMapping(value="product_list")
	public void product() {}

}
