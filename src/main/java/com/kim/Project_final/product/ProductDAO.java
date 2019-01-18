package com.kim.Project_final.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kim.Project_final.util.Pager;

@Repository
public class ProductDAO {

	@Inject
	private SqlSession session;
	private final String NAMESPACE = "productMapper.";
	
	public int totalCount(Pager pager) throws Exception {
		return session.selectOne(NAMESPACE+"totalCount",pager);
	}
	
	public List<ProductDTO> selectList(Pager pager) throws Exception {
		return session.selectList(NAMESPACE+"selectList",pager);
	}
	public int insert(ProductDTO productDTO) throws Exception {
		return session.insert(NAMESPACE+"insert", productDTO);
	}
}
