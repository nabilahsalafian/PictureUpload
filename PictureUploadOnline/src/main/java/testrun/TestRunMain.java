package testrun;

import java.io.File;

public class TestRunMain {

	public static void main(String[] args) {
		System.out.println("Hello");
		
		String appPath = "C:\\apache-tomcat-9.0.65\\wtpwebapps\\PictureUpload\\";
		String uploadPath = appPath + File.separator + "images";
		System.out.println("App Path: " + appPath);
		System.out.println("Upload Path: " + uploadPath);
		
		File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        else {
        	System.out.println("Directory already exists.");
        }

	}

}
