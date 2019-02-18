package com.kim.Project_final.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {

	public static String saveFile(MultipartFile file, String filePath) throws IOException {
		File f = new File(filePath);
		if(!f.exists()) {
			f.mkdirs();
		}
		StringBuilder sb = new StringBuilder();
		String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                .format(System.currentTimeMillis()))
                .append(UUID.randomUUID().toString())
                .append(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."))).toString();
		f = new File(filePath, saveName);
		file.transferTo(f);
		return saveName;
	}
	public static boolean nioFileCopy(String inFileName, String outFileName) {
		Path source = Paths.get(inFileName);
		Path target = Paths.get(outFileName);
		// 사전체크
		if (source == null) {
			throw new IllegalArgumentException("source must be specified");
		}
		if (target == null) {
			throw new IllegalArgumentException("target must be specified");
		}
		// 소스파일이 실제로 존재하는지 체크
		if (!Files.exists(source, new LinkOption[] {})) {
			throw new IllegalArgumentException("Source file doesn't exist: "
					+ source.toString());
		}
		try {
			Files.copy(source, target, StandardCopyOption.REPLACE_EXISTING); // 파일복사

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		if (Files.exists(target, new LinkOption[] {})) { // 파일이 정상적으로 생성이 되었다면
			// System.out.println("File Copied");
			return true; // true 리턴
		} else {
			System.out.println("File Copy Failed");
			return false; // 실패시 false
		}
	}
	public static void nioFileDelete(String inFolder) {
		
		try {
			if(Files.exists(Paths.get(inFolder))) {
				Files.delete(Paths.get(inFolder));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
