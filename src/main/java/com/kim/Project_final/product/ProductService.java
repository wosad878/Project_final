package com.kim.Project_final.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kim.Project_final.productBoard.ProductBoardDAO;
import com.kim.Project_final.productBoard.ProductBoardDTO;
import com.kim.Project_final.productImage.ProductImageDAO;
import com.kim.Project_final.productImage.ProductImageDTO;
import com.kim.Project_final.productImage.ProductImageService;
import com.kim.Project_final.util.Pager;

@Service
public class ProductService {

	@Inject
	private ProductDAO productDAO;
	@Inject
	private ProductBoardDAO productBoardDAO;
	@Inject
	private ProductImageDAO productImageDAO;
	
	public int totalCount (Pager pager) throws Exception {
		return productDAO.totalCount(pager);
	}
	
	public List<ProductDTO> selectOrder (Pager pager) throws Exception {
		return productDAO.selectOrder(pager);
	}
	
	public List<ProductDTO> selectList(Pager pager) throws Exception {
		return productDAO.selectList(pager);
	}
	
	@Transactional()
	public void insert(ProductDTO productDTO, ProductBoardDTO productBoardDTO, List<ProductImageDTO> ar) throws Exception {
		int result = productDAO.insert(productDTO);
		productBoardDTO.setNum(productDTO.getNum());
		productBoardDAO.insert(productBoardDTO);
		productImageDAO.insert(ar, productDTO.getNum());
	}
	public void update(ProductDTO productDTO, ProductBoardDTO productBoardDTO, List<ProductImageDTO> ar) throws Exception {
		productDAO.update(productDTO);
		productBoardDTO.setNum(productDTO.getNum());
		productBoardDAO.update(productBoardDTO);
		productImageDAO.update(ar, productDTO.getNum());
	}
	public ProductDTO selectOne(int num) throws Exception {
		ProductDTO productDTO = productDAO.selectOne(num);
		productDTO.setImages(productImageDAO.selectImages(num));
		productDTO.setProductBoardDTO(productBoardDAO.selectOne(num));
		return productDTO;
	}
	public void deleteAll(int num) throws Exception {
		productDAO.delete(num);
		productBoardDAO.delete(num);
		productImageDAO.imgDelete(num);
	}
	public ProductDTO selectOne(String name) throws Exception {
		return productDAO.selectOne(name);
	}
	public List<ProductDTO> bestMenuList(String check) throws Exception {
		return productDAO.bestMenuList(check);
	}
	public List<ProductDTO> newItemList() throws Exception {
		return productDAO.newItemList();
	}
}
