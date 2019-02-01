package com.kim.Project_final.address;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class AddressService {

	@Inject
	private AddressDAO addressDAO;
	
	public List<AddressDTO> selectList(String id) throws Exception {
		return addressDAO.selectList(id);
	}
}
