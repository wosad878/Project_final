package com.kim.Project_final;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kim.Project_final.ImgTemp.ImageTempService;
import com.kim.Project_final.product.ProductDTO;
import com.kim.Project_final.product.ProductService;
import com.kim.Project_final.productBoard.ProductBoardDTO;
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
	
	@RequestMapping(value="imageDelete",method=RequestMethod.GET)
	public String product_insert(boolean check) throws Exception {
		int result = imageTempService.imageNameDelete();
		return "redirect:./product_list";
	}
	
	@RequestMapping("product_insert")
	public void product_insert() {
		
	}
	
	@RequestMapping(value="product_insert",method=RequestMethod.POST)
	public String product_insert(@ModelAttribute ProductDTO productDTO,	@RequestParam(required=false) String contents, MultipartFile mainImage, @RequestParam(required=false)List<MultipartFile> subImage) throws Exception {
		System.out.println(productDTO.getName());
		System.out.println(productDTO.getCategory1());
		System.out.println(productDTO.getCategory2());
		for(int i=0;i<subImage.size();i++) {
			System.out.println(subImage.get(i).getOriginalFilename());
		}
		System.out.println(productDTO.getPrice());
		System.out.println(contents);
		return "";
	}
	
	@RequestMapping("product_select")
	public void product_select(int num) throws Exception {
		
	}

}
