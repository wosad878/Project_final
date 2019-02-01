package com.kim.Project_final;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kim.Project_final.address.AddressDTO;

@Controller
@RequestMapping("/address/**")
public class AddressController {

	@RequestMapping("addressForm")
	public List<AddressDTO> addressList(){
		
		return 
	}
}
