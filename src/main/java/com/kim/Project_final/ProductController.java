package com.kim.Project_final;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kim.Project_final.ImgTemp.ImageTempService;
import com.kim.Project_final.member.MemberDTO;
import com.kim.Project_final.product.ProductDTO;
import com.kim.Project_final.product.ProductService;
import com.kim.Project_final.productBoard.ProductBoardDTO;
import com.kim.Project_final.productBoard.productBoardService;
import com.kim.Project_final.productImage.ProductImageDTO;
import com.kim.Project_final.util.FileUploader;
import com.kim.Project_final.util.Pager;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	@Inject
	private ProductService productService;
	@Inject
	private ImageTempService imageTempService;
	@Inject
	private productBoardService productBoardService;
	
	@RequestMapping("product_list_order")
	public String product_order(Pager pager, Model model) throws Exception {
		pager.makeRow();
		int totalCount = productService.totalCount(pager);
		pager.makePage(totalCount);
		List<ProductDTO> ar = productService.selectOrder(pager);
		System.out.println(ar.size());
		model.addAttribute("list", ar);
		return "product/product_list";
	}
	
	@RequestMapping(value="product_list")
	public String product(Model model, Pager pager, HttpSession session) throws Exception {
		String outFolder = session.getServletContext().getRealPath("resources/photoUpload/");
		System.out.println(outFolder);
		int totalCount = productService.totalCount(pager);
		pager.makeRow();
		pager.makePage(totalCount);
		
		List<ProductDTO> ar = productService.selectList(pager);
		model.addAttribute("list",ar).addAttribute("pager",pager).addAttribute("totalCount", totalCount);
		return "product/product_list";
	}
	
	@RequestMapping(value="imageDelete",method=RequestMethod.GET)
	public String product_insert(HttpSession session,boolean check) throws Exception {
		String userId = ((MemberDTO)session.getAttribute("member")).getId();
		String inFolder = session.getServletContext().getRealPath("resources/photoTemp/");
		List<String> ar = imageTempService.selectList(userId);
		if(ar.size() != 0) {
			for(int i=0; i< ar.size(); i++) {
				FileUploader.nioFileDelete(inFolder+ar.get(i));
			}
		imageTempService.imageNameDelete(userId);
		}
		return "redirect:./product_list";
	}
	
	@RequestMapping("product_insert")
	public void product_insert() {
		
	}
	
	@RequestMapping(value="product_insert",method=RequestMethod.POST)
	@Transactional
	public String product_insert(HttpSession session, @ModelAttribute ProductDTO productDTO, @RequestParam(required=false) String contents, MultipartFile mainImage, @RequestParam(required=false)List<MultipartFile> subImage) throws Exception {
		if(productDTO.getStock() == null) {
			productDTO.setStock(0);
		}
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String userId = memberDTO.getId();
		List<String> ar = imageTempService.selectList(userId);
		List<String>ar2 = null;
		List<ProductImageDTO> ar3 = null;
		ProductBoardDTO productBoardDTO = new ProductBoardDTO();
		ProductImageDTO productImageDTO = null;
		String inFolder = session.getServletContext().getRealPath("resources/photoTemp/");
		
		String outFolder = session.getServletContext().getRealPath("resources/photoUpload/");
		String [] array = {};
		String [] array2 = {};
		
		productDTO.setOname(mainImage.getOriginalFilename());
		productDTO.setFname(FileUploader.saveFile(mainImage, outFolder));
		productBoardDTO.setName(productDTO.getName());
		contents = contents.replaceAll("http://localhost:80/Project_final/", "/Project_final/");
		contents = contents.replaceAll("/photoTemp/", "/photoUpload/");
		productBoardDTO.setContents(contents);
		
		ar3 = new ArrayList<ProductImageDTO>();
		for(int i=0; i< subImage.size(); i++) {
			productImageDTO = new ProductImageDTO();
			productImageDTO.setName(productDTO.getName());
			productImageDTO.setOname(subImage.get(i).getOriginalFilename());
			productImageDTO.setFname(FileUploader.saveFile(subImage.get(i),outFolder));
			ar3.add(productImageDTO);
		}
		productService.insert(productDTO,productBoardDTO,ar3);
	
		for(int i=0;i<ar.size();i++) {
			array = contents.split("/photoUpload/");
		}
		ar2 = new ArrayList<String>();
		for(int i=0;i<array.length; i++) {
			System.out.println(array[i]);
			array2 = array[i].split("\"");
			System.out.println(array2[0]);
			ar2.add(array2[0]);
		}
		
		ar3 = new  ArrayList<ProductImageDTO>(); 
		for(int i=1; i<ar2.size(); i++) {
			FileUploader.nioFileCopy(inFolder+ar2.get(i), outFolder+ar2.get(i));
			productImageDTO = new ProductImageDTO();
			productImageDTO.setName(productDTO.getName());
			productImageDTO.setFname(ar2.get(i));
			ar3.add(productImageDTO);
		}
		int num = productService.selectOne(productDTO.getName()).getNum();
		productBoardService.imgInsert(ar3, num);
		for(int i=0; i<ar.size(); i++) {
			FileUploader.nioFileDelete(inFolder+ar.get(i));
		}
		imageTempService.imageNameDelete(userId);
		return "redirect:/product/product_list";
	}
	
	@RequestMapping("product_select")
	public void product_select(int num, Model model,HttpSession session) throws Exception {
		ProductDTO productDTO = productService.selectOne(num);
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		model.addAttribute("product", productDTO).addAttribute("images",productDTO.getImages()).addAttribute("member",memberDTO);
	}

}
