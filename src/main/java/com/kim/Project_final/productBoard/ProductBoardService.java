package com.kim.Project_final.productBoard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kim.Project_final.productImage.ProductImageDTO;

@Service
public class ProductBoardService {

	@Inject
	private ProductBoardDAO productBoardDAO;
	
	public int imgInsert(List<ProductImageDTO> ar, int num) throws Exception {
		return productBoardDAO.imgInsert(ar, num);
	}
	public int imgDelete(int num) throws Exception {
		return productBoardDAO.imgDelete(num);
	}
}
