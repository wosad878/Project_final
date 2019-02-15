package com.kim.Project_final.product;

import java.util.List;

import org.springframework.stereotype.Component;

import com.kim.Project_final.productBoard.ProductBoardDTO;
import com.kim.Project_final.productImage.ProductImageDTO;

@Component
public class ProductDTO {

	private Integer num;
	private String name;
	private String category1;
	private String category2;
	private Integer oPrice;
	private Integer price;
	private String weight;
	private String life;
	private String deliver;
	private String event;
	private String tag;
	private String memo;
	private String bindname;
	private Integer stock;
	private String reg_date;
	private Integer count;
	private String fname;
	private String oname;
	private String minorder;
	private List<ProductImageDTO> images;
	private ProductBoardDTO productBoardDTO;
	
	public ProductBoardDTO getProductBoardDTO() {
		return productBoardDTO;
	}
	public void setProductBoardDTO(ProductBoardDTO productBoardDTO) {
		this.productBoardDTO = productBoardDTO;
	}
	public List<ProductImageDTO> getImages() {
		return images;
	}
	public void setImages(List<ProductImageDTO> images) {
		this.images = images;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String catgory1) {
		this.category1 = catgory1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public Integer getoPrice() {
		return oPrice;
	}
	public void setoPrice(Integer oPrice) {
		this.oPrice = oPrice;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getLife() {
		return life;
	}
	public void setLife(String life) {
		this.life = life;
	}
	public String getDeliver() {
		return deliver;
	}
	public void setDeliver(String deliver) {
		this.deliver = deliver;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getBindname() {
		return bindname;
	}
	public void setBindname(String bindname) {
		this.bindname = bindname;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getMinorder() {
		return minorder;
	}
	public void setMinorder(String minorder) {
		this.minorder = minorder;
	}
	
}
