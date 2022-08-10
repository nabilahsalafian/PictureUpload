package picture.servlet;

import java.io.*;
//import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import picture.dao.*;
import picture.javabean.*;



@WebServlet("/FileServlet")
@MultipartConfig(maxFileSize = 16177216) // 16MB

public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String UPLOAD_DIR = "images" + File.separator + "tempAddFiles";
	FileDetailsDAO fdDAO = null;
	HttpSession session = null;
	
	// Connection object
	Connection connection = null;
	
    public FileServlet() {
        super();
        fdDAO = new FileDetailsDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		try {
			
			switch(action) {
			
			case "addFile":
				addFile(request, response);
				break;
				
			case "getApplicationPath":
				applicationPath(request, response);
				break;
			
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}	
		
		
	// CRUD ---------------------------------
	
	// Add File
	private void addFile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, SQLException, IOException {
		Part part = request.getPart("testFile");
		
		String imageFileName = part.getSubmittedFileName();
		System.out.println("File Name: " + imageFileName);
		
		// Create Temporary Path (Image Directory) for Image Storing in Server
		String appPath = getServletContext().getRealPath("");
		String uploadDirectory = appPath + UPLOAD_DIR;
		
		System.out.println("App Path: " + appPath);
		System.out.println("Upload Path: " + uploadDirectory + "\n - - - ");
		
		File fileUploadDirectory = new File(uploadDirectory);
        
		if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
            System.out.println("Directory added.\n - - - ");
        }
        else {
        	System.out.println("Directory exists.\n - - - ");
        }
		
        String savePath = uploadDirectory + File.separator + imageFileName;
        System.out.println("savePath: " + savePath);
		
        // Write the image in the image directory
        part.write(savePath + File.separator);
        
        //Save file to database using FileInputStream
        FileDetails newFile = new FileDetails();
        
        newFile.setFilename(imageFileName);
        newFile.setFilepath(savePath);
        
        try {
        	fdDAO.addFile(newFile);
        	
        } catch (SQLException e) {
        	e.printStackTrace();
        }
         
        request.setAttribute("filename", imageFileName);
        RequestDispatcher toPage = request.getRequestDispatcher("success.jsp");
        toPage.forward(request, response);
        
	}
	
	private void applicationPath(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, SQLException, IOException {
	
		String page = request.getParameter("page");
		
		// Create Temporary Path (Image Directory) for Image Storing in Server
		String appPath = getServletContext().getRealPath("");
		System.out.println("App Path: " + appPath + "\n - - - ");
		
		session = request.getSession();
		session.setAttribute("appPath", appPath);
		
		RequestDispatcher toPage = request.getRequestDispatcher(page);
        toPage.forward(request, response);
		
	}
}
