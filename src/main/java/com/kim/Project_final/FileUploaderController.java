package com.kim.Project_final;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kim.Project_final.ImgTemp.ImageTempDTO;
import com.kim.Project_final.ImgTemp.ImageTempService;
import com.kim.Project_final.member.MemberDTO;

@Controller
public class FileUploaderController {
	
	@Inject
	private ImageTempService imageTempService; 

	// 다중파일업로드
    @RequestMapping(value = "/file_uploader_html5", method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request, HttpSession session) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = session.getServletContext().getRealPath("resources/photoTemp/");
            System.out.println(filePath);
            File file = new File(filePath);
            if(!file.exists()) {
            	file.mkdirs();
            }
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            
            ImageTempDTO imageTempDTO = new ImageTempDTO();
            imageTempDTO.setImgname(saveName);
            imageTempDTO.setUserId(((MemberDTO)session.getAttribute("member")).getId());
            imageTempService.imageNameSave(imageTempDTO);
            
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:80/Project_final/resources/photoTemp/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
	
}
