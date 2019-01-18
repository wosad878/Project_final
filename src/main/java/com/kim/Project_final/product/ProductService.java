package com.kim.Project_final.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kim.Project_final.productBoard.ProductBoardDAO;
import com.kim.Project_final.productBoard.ProductBoardDTO;
import com.kim.Project_final.productImage.ProductImageDAO;
import com.kim.Project_final.productImage.ProductImageDTO;
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
	
	public List<ProductDTO> selectList(Pager pager) throws Exception {
		return productDAO.selectList(pager);
	}
	
	@Transactional()
	public void insert(ProductDTO productDTO, ProductBoardDTO productBoardDTO, List<ProductImageDTO> ar) throws Exception {
		productDAO.insert(productDTO);
		productBoardDAO.insert(productBoardDTO);
		productImageDAO.insert(ar);
	}
}
