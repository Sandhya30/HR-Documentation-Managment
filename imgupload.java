/*
 * 
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Efficient;

/**
 *
 *
 */


import databaseconnection.databasecon;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.util.Date;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/imgupload")
public class imgupload extends HttpServlet {
    /*
     create images folder at, C:\Users\Dharmesh Mourya\Documents\NetBeansProjects\ImageProject\build\web\images
     */

    public static final String UPLOAD_DIR = "leaves";
    public String imgpath = "";
       String filename="";
         String key="";
        String imgname="";
        String status="Normal";
        String username="";
      //  String username = (String) request.getSession().getAttribute("username");
        
//String username = (String) request.getSession().getAttribute("username");
       // String username=session.getAttribute("username").toString();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Part part = request.getPart("file");//
        String fileName = extractFileName(part);//file name
 String username = (String) request.getSession().getAttribute("username");
 String email = (String) request.getSession().getAttribute("email");
  String tl = request.getParameter("tl");
    String qualification = request.getParameter("qualification");
     String exp = request.getParameter("exp");
// String branch = (String) request.getSession().getAttribute("branch");
Date date=new Date();
 
        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        imgpath = UPLOAD_DIR + File.separator + fileName;
        imgname=fileName;
        part.write(savePath + File.separator);
        
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
        
         }*/
        try {
            Connection con=databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement("insert into file(username,filename,filepath,email,tl,qualification,exp) values(?,?,?,?,?,?,?)");
            
           // pst.setInt(1, id);
             pst.setString(1, username);
            pst.setString(2, imgname);
            pst.setString(3, imgpath);
            pst.setString(4, email);
            pst.setString(5, tl);
          pst.setString(6, qualification);
           pst.setString(7, exp);
           //  pst.setString(7, branch);
            //  pst.setString(8, date.toString());
         //   pst.setString(4, key);
        //    pst.setString(5, status);
            pst.executeUpdate();
            response.sendRedirect("upload.jsp?msg=Success");
        } catch (Exception e) {
            out.println(e);
        }

    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
