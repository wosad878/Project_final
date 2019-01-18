package com.kim.Project_final.ImgTemp;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ImageTempDAO {

	@Inject
	private SqlSession session;
	private final String NAMESPACE = "ImageTempMapper.";
	
	public int imageNameSave(ImageTempDTO imageTempDTO) throws Exception {
		return session.insert(NAMESPACE+"insert", imageTempDTO);
	}
	public List<String> selectList(String userId) throws Exception {
		return session.selectList(NAMESPACE+"selectList", userId);
	}
	
	public int imageNameDelete(String userId) throws Exception {
		return session.delete(NAMESPACE+"delete", userId);
	}
}
