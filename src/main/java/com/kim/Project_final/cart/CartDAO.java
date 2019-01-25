package com.kim.Project_final.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Inject
	private SqlSession session;
	private final String NAMESPACE = "cartMapper.";
	
	public int cartInsert(CartDTO cartDTO) throws Exception {
		return session.insert(NAMESPACE+"cartInsert", cartDTO);
	}
	public CartDTO cartSelect(CartDTO cartDTO) throws Exception {
		return session.selectOne(NAMESPACE+"cartSelect", cartDTO);
	}
	public List<CartDTO> cartSelectList(String id) throws Exception {
		return session.selectList(NAMESPACE+"selectList", id);
	}
	public int cartUpdate(CartDTO cartDTO) throws Exception {
		return session.update(NAMESPACE+"cartUpdate", cartDTO);
	}
	public int cartDeleteAll(String id) throws Exception {
		return session.delete(NAMESPACE+"deleteAll", id);
	}
	public int cartDeleteOne(String proname) throws Exception {
		return session.delete(NAMESPACE+"deleteOne", proname);
	}
}
