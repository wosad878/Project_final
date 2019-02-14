package com.kim.Project_final.productImage;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProductImageService {

	@Inject
	private ProductImageDAO productImageDAO;
	
	public List<ProductImageDTO> selectImage(int num) throws Exception {
		return productImageDAO.selectImages(num);
	}
	public int imgDelete(int num) throws Exception {
		return productImageDAO.imgDelete(num);
	}
}
