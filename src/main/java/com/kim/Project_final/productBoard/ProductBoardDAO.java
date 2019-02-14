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
	public int update(ProductBoardDTO productBoardDTO) throws Exception {
		return session.insert(NAMESPACE+"update", productBoardDTO);
	}
	public int imgDelete(int num) throws Exception {
		return session.delete(NAMESPACE+"imgDelete", num);
	}
	public int imgInsert(List<ProductImageDTO> ar, int num) throws Exception {
		for(int i=0; i< ar.size(); i++) {
			ar.get(i).setNum(num);
			session.insert(NAMESPACE+"imgInsert", ar.get(i));
		}
		return 1;
	}
	public ProductBoardDTO selectOne(int num) throws Exception {
		return session.selectOne(NAMESPACE+"selectOne", num);
	}
}
