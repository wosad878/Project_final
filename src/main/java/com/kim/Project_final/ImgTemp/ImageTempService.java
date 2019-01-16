package com.kim.Project_final.ImgTemp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ImageTempService {

	@Inject
	private ImageTempDAO imageTempDAO;
	
	public int imageNameSave(String saveName) throws Exception {
		return imageTempDAO.imageNameSave(saveName);
	}
	public int imageNameDelete() throws Exception {
		return imageTempDAO.imageNameDelete();
	}
}
