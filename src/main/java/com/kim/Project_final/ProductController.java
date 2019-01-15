package com.kim.Project_final;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kim.Project_final.product.ProductDTO;
import com.kim.Project_final.product.ProductService;
import com.kim.Project_final.util.Pager;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	@Inject
	private ProductService productService;
	
	@RequestMapping(value="product_list")
	public String product(Model model, Pager pager) throws Exception {
		int totalCount = productService.totalCount(pager);
		pager.makeRow();
		pager.makePage(totalCount);
		
		List<ProductDTO> ar = productService.selectList(pager);
		model.addAttribute("list",ar).addAttribute("pager",pager).addAttribute("totalCount", totalCount);
		return "product/product_list";
	}

}
