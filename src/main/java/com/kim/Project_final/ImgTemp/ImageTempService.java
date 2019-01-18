package com.kim.Project_final.ImgTemp;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ImageTempService {

	@Inject
	private ImageTempDAO imageTempDAO;
	
	public int imageNameSave(ImageTempDTO imageTempDTO) throws Exception {
		return imageTempDAO.imageNameSave(imageTempDTO);
	}
	public List<String> selectList(String userId) throws Exception {
		return imageTempDAO.selectList(userId);
	}
	public int imageNameDelete(String userId) throws Exception {
		return imageTempDAO.imageNameDelete(userId);
	}
}
