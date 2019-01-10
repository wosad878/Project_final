package com.kim.Project_final.Ajax;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AjaxDAO {

	@Inject
	private SqlSession session;
	private final String NAMESPACE = "ajaxMapper.";
	
	public String checkId(String id) throws Exception {
		return session.selectOne(NAMESPACE+"checkId", id);
	}
}
