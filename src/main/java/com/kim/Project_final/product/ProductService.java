package com.kim.Project_final.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kim.Project_final.util.Pager;

@Service
public class ProductService {

	@Inject
	private ProductDAO productDAO;
	
	public int totalCount (Pager pager) throws Exception {
		return productDAO.totalCount(pager);
	}
	
	public List<ProductDTO> selectList(Pager pager) throws Exception {
		return productDAO.selectList(pager);
	}
}
