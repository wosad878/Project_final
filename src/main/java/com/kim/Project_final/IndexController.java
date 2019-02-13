package com.kim.Project_final;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kim.Project_final.product.ProductDTO;
import com.kim.Project_final.product.ProductService;

@Controller
@RequestMapping(value="/index/**")
public class IndexController {
	
	@Inject
	private ProductService productService;

	@RequestMapping("home")
	public void index(Model model) throws Exception {
		List<ProductDTO> ar = productService.bestMenuList("count");
		List<ProductDTO> ar2 = productService.bestMenuList("reg_date");
		model.addAttribute("best", ar).addAttribute("newItem", ar2);
	}
	
}

