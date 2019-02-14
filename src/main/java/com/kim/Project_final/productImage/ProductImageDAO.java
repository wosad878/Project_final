package com.kim.Project_final.productImage;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductImageDAO {

	@Inject
	private SqlSession session;
	private final String NAMESPACE = "productImageMapper.";
	
	public int insert(List<ProductImageDTO> ar, int num) throws Exception{
		int result = 0;
		for(int i=0; i< ar.size(); i++) {
			ar.get(i).setNum(num);
			result = session.insert(NAMESPACE+"insert", ar.get(i));
			if(result < 1) {
				new Exception("DB저장 오류");
			}
		}
		return result;
	}
	public int update(List<ProductImageDTO> ar, int num) throws Exception{
		int result = 0;
		for(int i=0; i< ar.size(); i++) {
			ar.get(i).setNum(num);
			result = session.insert(NAMESPACE+"update", ar.get(i));
			if(result < 1) {
				new Exception("DB저장 오류");
			}
		}
		return result;
	}
	public int imgDelete(int num) throws Exception {
		return session.delete(NAMESPACE+"imgDelete", num);
	}
//	public List<ProductImageDTO> selectImages(String name) throws Exception {
//		return session.selectList(NAMESPACE+"selectImages", name);
//	}
	public List<ProductImageDTO> selectImages(int num) throws Exception {
		return session.selectList(NAMESPACE+"selectImages", num);
	}
}
