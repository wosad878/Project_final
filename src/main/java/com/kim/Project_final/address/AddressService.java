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
	public int insert(AddressDTO addressDTO) throws Exception {
		return addressDAO.insert(addressDTO);
	}
	public AddressDTO selectOne(int num) throws Exception {
		return addressDAO.selectOne(num);
	}
	public int update(AddressDTO addressDTO) throws Exception {
		return addressDAO.update(addressDTO);
	}
}
