package com.kim.Project_final.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<ProductDTO> selectOrder(Pager pager) throws Exception {
		return session.selectList(NAMESPACE+"selectOrder", pager);
	}
	
	public List<ProductDTO> selectList(Pager pager) throws Exception {
		return session.selectList(NAMESPACE+"selectList",pager);
	}
	
	public int insert(ProductDTO productDTO) throws Exception {
		return session.insert(NAMESPACE+"insert", productDTO);
	}
	public int update(ProductDTO productDTO) throws Exception {
		return session.update(NAMESPACE+"update", productDTO);
	}
	public int delete(int num) throws Exception {
		return session.delete(NAMESPACE+"delete", num);
	}
	public ProductDTO selectOne(int num) throws Exception {
		return session.selectOne(NAMESPACE+"selectOne", num);
	}
	public ProductDTO selectOne(String name) throws Exception {
		return session.selectOne(NAMESPACE+"selectNOne",name);
	}
	public List<ProductDTO> bestMenuList(String check) throws Exception {
		Map<String, String> m = new HashMap<String, String>();
		m.put("check", check);
		return session.selectList(NAMESPACE+"bestMenu", m);
	}
	public List<ProductDTO> newItemList() throws Exception {
		return session.selectList(NAMESPACE+"newItemList");
	}
}
