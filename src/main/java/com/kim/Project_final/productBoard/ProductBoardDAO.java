package com.kim.Project_final.productBoard;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kim.Project_final.productImage.ProductImageDTO;

@Repository
public class ProductBoardDAO {
	@Inject
	private SqlSession session;
	private final String NAMESPACE = "productBoardMapper.";
	
	public int insert(ProductBoardDTO productBoardDTO) throws Exception {
		return session.insert(NAMESPACE+"insert", productBoardDTO);
	}
	public int imgInsert(List<ProductImageDTO> ar) throws Exception {
		for(int i=0; i< ar.size(); i++) {
			session.insert(NAMESPACE+"imgInsert", ar.get(i));
		}
		return 1;
	}
	public ProductBoardDTO selectOne(String name) throws Exception {
		return session.selectOne(NAMESPACE+"selectOne", name);
	}
}
