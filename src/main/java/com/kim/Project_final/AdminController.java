package com.kim.Project_final;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kim.Project_final.ImgTemp.ImageTempService;
import com.kim.Project_final.cart.CartDTO;
import com.kim.Project_final.cart.CartService;
import com.kim.Project_final.member.MemberDTO;
import com.kim.Project_final.product.ProductDTO;
import com.kim.Project_final.product.ProductService;
import com.kim.Project_final.productBoard.ProductBoardDTO;
import com.kim.Project_final.productBoard.ProductBoardService;
import com.kim.Project_final.productImage.ProductImageDTO;
import com.kim.Project_final.util.FileUploader;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Inject
	private ProductService productService;
	@Inject
	private ImageTempService imageTempService;
	@Inject
	private ProductBoardService productBoardService;
	@Inject
	private CartService cartService;
	
	public List<ProductImageDTO> array3(List<String> ar2, String inFolder, String outFolder, ProductDTO productDTO){
		List<ProductImageDTO> ar = new  ArrayList<ProductImageDTO>(); 
		for(int i=1; i<ar2.size(); i++) {
			FileUploader.nioFileCopy(inFolder+ar2.get(i), outFolder+ar2.get(i));
			ProductImageDTO productImageDTO = new ProductImageDTO();
			productImageDTO.setName(productDTO.getName());
			productImageDTO.setFname(ar2.get(i));
			ar.add(productImageDTO);
		}
		return ar;
	}
	public List<String> array2(String contents, List<String> ar){
		String [] array = {};
		String [] array2 = {};
		for(int i=0;i<ar.size();i++) {
			array = contents.split("/photoUpload/");
		}
		List<String> ar2 = new ArrayList<String>();
		for(int i=0;i<array.length; i++) {
//			System.out.println(array[i]);
			array2 = array[i].split("\"");
//			System.out.println(array2[0]);
			ar2.add(array2[0]);
		}
		return ar2;
	}
	public List<ProductImageDTO> ProductImage(ProductDTO productDTO, List<MultipartFile> subImage, String outFolder) throws Exception {
		List<ProductImageDTO> ar = new ArrayList<ProductImageDTO>();
		for(int i=0; i< subImage.size(); i++) {
			ProductImageDTO productImageDTO = new ProductImageDTO();
			productImageDTO.setName(productDTO.getName());
			productImageDTO.setOname(subImage.get(i).getOriginalFilename());
			productImageDTO.setFname(FileUploader.saveFile(subImage.get(i),outFolder));
			ar.add(productImageDTO);
		}
		return ar;
	}
	public ProductBoardDTO board(ProductDTO productDTO, String contents) {
		ProductBoardDTO productBoardDTO = new ProductBoardDTO();
		productBoardDTO.setName(productDTO.getName());
		contents = contents.replaceAll("http://localhost:80/Project_final/", "/Project_final/");
		contents = contents.replaceAll("/photoTemp/", "/photoUpload/");
		productBoardDTO.setContents(contents);
		return productBoardDTO;
	}
	
	@RequestMapping("product_insert")
	public void product_insert() {
		
	}

	@RequestMapping(value="product_insert",method=RequestMethod.POST)
	public String product_insert(HttpSession session, @ModelAttribute ProductDTO productDTO,
			@RequestParam(required=false) String contents, MultipartFile mainImage,
			@RequestParam(required=false)List<MultipartFile> subImage) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String userId = memberDTO.getId();
		List<String> ar = imageTempService.selectList(userId);
		String inFolder = session.getServletContext().getRealPath("resources/photoTemp/");
		String outFolder = session.getServletContext().getRealPath("resources/photoUpload/");
		
		productDTO.setOname(mainImage.getOriginalFilename());
		productDTO.setFname(FileUploader.saveFile(mainImage, outFolder));
		
		ProductBoardDTO productBoardDTO = board(productDTO, contents);
		List<ProductImageDTO> ar3 = ProductImage(productDTO, subImage, outFolder);
		productService.insert(productDTO,productBoardDTO,ar3);
		List<String>ar2 = array2(productBoardDTO.getContents(), ar);
		ar3 = array3(ar2, inFolder, outFolder, productDTO);
		int num = productDTO.getNum();
		productBoardService.imgInsert(ar3, num);
		for(int i=0; i<ar.size(); i++) {
			FileUploader.nioFileDelete(inFolder+ar.get(i));
		}
		imageTempService.imageNameDelete(userId);
			
		return "redirect:/product/product_list?categoty1=1";
	}
	
	@RequestMapping("product_update")
	public void productUpdate(int num, Model model) throws Exception {
		ProductDTO productDTO = productService.selectOne(num);
		List<ProductImageDTO> ar = productDTO.getImages();
		ProductBoardDTO boardDTO = productDTO.getProductBoardDTO();
		model.addAttribute("product", productDTO).addAttribute("images", ar).addAttribute("board", boardDTO);
	}
	@RequestMapping(value="product_update", method = RequestMethod.POST)
	public String productupdate(HttpSession session, @ModelAttribute ProductDTO productDTO,
			@RequestParam(required=false) String contents, MultipartFile mainImage,
			@RequestParam(required=false)List<MultipartFile> subImage) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String userId = memberDTO.getId();
		int num = productDTO.getNum();
		productBoardService.imgDelete(num);
//		productImageService.imgDelete(num);
		
		List<String> ar = imageTempService.selectList(userId);
		String inFolder = session.getServletContext().getRealPath("resources/photoTemp/");
		String outFolder = session.getServletContext().getRealPath("resources/photoUpload/");
		
		productDTO.setOname(mainImage.getOriginalFilename());
		productDTO.setFname(FileUploader.saveFile(mainImage, outFolder));
		
		ProductBoardDTO productBoardDTO = board(productDTO, contents);
		List<ProductImageDTO> ar3 = ProductImage(productDTO, subImage, outFolder);
		productService.update(productDTO,productBoardDTO,ar3);
		List<String>ar2 = array2(productBoardDTO.getContents(), ar);
		ar3 = array3(ar2, inFolder, outFolder, productDTO);
		productBoardService.imgInsert(ar3, num);
		for(int i=0; i<ar.size(); i++) {
			FileUploader.nioFileDelete(inFolder+ar.get(i));
		}
		imageTempService.imageNameDelete(userId);
			
		return "redirect:/product/product_list";
		
	}
	
	@RequestMapping("product_delete")
	public String product_delete(int num, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		CartDTO cartDTO = new CartDTO();
		cartDTO.setNum(num);
		cartDTO.setId(memberDTO.getId());
		List<CartDTO> ar = cartService.cartSelectList(memberDTO.getId());
		for(CartDTO dto : ar) {
			if(num == dto.getNum()) {
				cartService.cartDeleteOne(dto.getProname());
			}
		}
		productService.deleteAll(num);
		productBoardService.deleteAll(num);
		return "redirect:/product/product_list";
	}
//	@RequestMapping(value="imageDelete",method=RequestMethod.GET)
//	public String product_insert(HttpSession session,boolean check) throws Exception {
//		String userId = ((MemberDTO)session.getAttribute("member")).getId();
//		String inFolder = session.getServletContext().getRealPath("resources/photoTemp/");
//		List<String> ar = imageTempService.selectList(userId);
//		if(ar.size() != 0) {
//			for(int i=0; i< ar.size(); i++) {
//				FileUploader.nioFileDelete(inFolder+ar.get(i));
//			}
//		imageTempService.imageNameDelete(userId);
//		}
//		return "redirect:../product/product_list";
//	}

	
}
