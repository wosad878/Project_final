package com.kim.Project_final.Ajax;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class AjaxService {

	@Inject
	private AjaxDAO ajaxDAO;
	
	public String checkId(String id) throws Exception {
		return ajaxDAO.checkId(id);
	}
}
