package com.kim.Project_final.ImgTemp;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ImageTempDAO {

	@Inject
	private SqlSession session;
	private final String NAMESPACE = "ImageTempMapper.";
	
	public int imageNameSave(String saveName) throws Exception {
		return session.insert(NAMESPACE+"insert", saveName);
	}
	public int imageNameDelete() throws Exception {
		return session.delete(NAMESPACE+"delete");
	}
}
