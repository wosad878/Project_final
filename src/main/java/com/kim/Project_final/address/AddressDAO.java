package com.kim.Project_final.address;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDAO {

	@Inject
	private SqlSession session;
	private final String NAMESPACE = "addressMapper.";
	
	public List<AddressDTO> selectList(String id) throws Exception {
		return session.selectList(NAMESPACE+"selectList", id);
	}
	public int insert(AddressDTO addressDTO) throws Exception {
		return session.insert(NAMESPACE+"insert", addressDTO);
	}
}
