package com.kim.Project_final.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession session;
	private final String NAMESPACE = "memberMapper.";
	
	public void memberJoin(MemberDTO memberDTO) {
		session.insert(NAMESPACE+"insert",memberDTO);
	}
}
