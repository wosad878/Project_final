package com.kim.Project_final.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
}
