package com.kim.Project_final;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kim.Project_final.member.MemberDTO;
import com.kim.Project_final.product.ProductDTO;
import com.kim.Project_final.product.ProductService;
import com.kim.Project_final.util.Pager;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	@Inject
	private ProductService productService;
	
	@RequestMapping("product_search")
	public String product_search(String text, Model model) throws Exception {
		Pager pager = new Pager();
		pager.makeRow();
		pager.setSearch(text);
		int totalCount = productService.totalCount(pager);
		pager.makePage(totalCount);
		List<ProductDTO> ar = productService.selectList(pager);
		model.addAttribute("list", ar).addAttribute("totalCount", totalCount);
		return "/product/product_list";
	}
	
	public List<ProductDTO> event(Pager pager) throws Exception {
		pager.setCategory2("");
		List<ProductDTO> ar = productService.selectOrder(pager);
		List<ProductDTO> ar2 = new ArrayList<ProductDTO>();
		for(ProductDTO dto : ar) {
			if(dto.getEvent() != null) {
				ar2.add(dto);
			}
		}
		return ar2;
	}
	
	@RequestMapping("product_list_order")
	public String product_order(Pager pager, Model model) throws Exception {
		String cat = pager.getCategory2();
		pager.makeRow();
		int totalCount = productService.totalCount(pager);
		pager.makePage(totalCount);
		List<ProductDTO> ar2 = new ArrayList<ProductDTO>();
		if(pager.getCategory2().equals("이벤트")) {
			ar2 = event(pager);
			totalCount = ar2.size();
			pager.setCategory2("이벤트");
			model.addAttribute("list", ar2).addAttribute("totalCount", totalCount);
		}else if(pager.getCategory2().equals("신상품")||pager.getCategory2().equals("베스트셀러")){
			cat = pager.getCategory2();
			pager.setCategory2("");
			List<ProductDTO> ar = productService.selectOrder(pager);
			for(int i = 0; i < ar.size(); i++) {
				if(i < 10) {
					ar2.add(ar.get(i));
				}
			}
			totalCount = ar2.size();
			pager.setCategory2(cat);
			model.addAttribute("list", ar2).addAttribute("totalCount", totalCount);
		}else {
			pager.setCategory2("");
			List<ProductDTO> ar = productService.selectOrder(pager);
			pager.setCategory2(cat);
			model.addAttribute("list", ar).addAttribute("totalCount", totalCount);
		}
		return "product/product_list";
	}
	
	@RequestMapping(value="product_list")
	public String product(Model model, Pager pager, HttpSession session) throws Exception {
		String outFolder = session.getServletContext().getRealPath("resources/photoUpload/");
		System.out.println(outFolder);
		int totalCount = productService.totalCount(pager);
		pager.makeRow();
		pager.makePage(totalCount);
		List<ProductDTO> ar2 = new ArrayList<ProductDTO>();
		if(pager.getCategory2().equals("이벤트")) {
			ar2 = event(pager);
			model.addAttribute("list", ar2);
		}else {
			List<ProductDTO> ar = productService.selectList(pager);
			model.addAttribute("list", ar);
		}
		model.addAttribute("pager",pager).addAttribute("totalCount", totalCount);
		return "product/product_list";
	}
	
	@RequestMapping("product_select")
	public void product_select(int num, Model model,HttpSession session) throws Exception {
		ProductDTO productDTO = productService.selectOne(num);
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		model.addAttribute("product", productDTO).addAttribute("images",productDTO.getImages()).addAttribute("member",memberDTO);
	}

}
