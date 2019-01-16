package com.kim.Project_final;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kim.Project_final.ImgTemp.ImageTempService;
import com.kim.Project_final.product.ProductDTO;
import com.kim.Project_final.product.ProductService;
import com.kim.Project_final.util.Pager;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	@Inject
	private ProductService productService;
	@Inject
	private ImageTempService imageTempService;
	
	
	@RequestMapping(value="product_list")
	public String product(Model model, Pager pager) throws Exception {
		int totalCount = productService.totalCount(pager);
		pager.makeRow();
		pager.makePage(totalCount);
		
		List<ProductDTO> ar = productService.selectList(pager);
		model.addAttribute("list",ar).addAttribute("pager",pager).addAttribute("totalCount", totalCount);
		return "product/product_list";
	}
	@RequestMapping("product_insert")
	public void product_insert() {
		
	}
	
	@RequestMapping(value="product_insert",method=RequestMethod.POST)
	@ResponseBody
	public String product_insert(String path) throws Exception{
		int result = imageTempService.imageNameDelete();
		if(result > 0) {
			return "sda";
		}else {
			return "111";		
		}
	}
	
	@RequestMapping("product_select")
	public void product_select(int num) throws Exception {
		
	}

}
