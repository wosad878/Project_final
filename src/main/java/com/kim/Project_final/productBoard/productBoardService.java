package com.kim.Project_final.productBoard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kim.Project_final.productImage.ProductImageDTO;

@Service
public class productBoardService {

	@Inject
	private ProductBoardDAO productBoardDAO;
	
	public int imgInsert(List<ProductImageDTO> ar) throws Exception {
		return productBoardDAO.imgInsert(ar);
	}
}
