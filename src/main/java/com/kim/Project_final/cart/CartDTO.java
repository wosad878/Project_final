package com.kim.Project_final.cart;

import org.springframework.stereotype.Component;

import com.kim.Project_final.product.ProductDTO;

@Component
public class CartDTO {

	private String id;
	private String proname;
	private String quantity;
	private ProductDTO productDTO;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	
}
