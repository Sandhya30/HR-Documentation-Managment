
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>

<html>
<body>
<%
   Connection co = null;
           String hr=session.getAttribute("username").toString();
             String language=request.getParameter("language");
            String qualification=request.getParameter("qualification");
            String exp=request.getParameter("exp");
              String about=request.getParameter("about");
             String company=request.getParameter("company");
              String username=request.getParameter("username");
             String email=request.getParameter("email");
             
             
          
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into request(hr,language,qualification,exp,about,company,username,email,cficates,file1,file2,fpath,status,fpath1) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        pst2.setString(1,hr);
	pst2.setString(2,language);
        pst2.setString(3,qualification); 
        pst2.setString(4,exp); 
        pst2.setString(5,about);
         pst2.setString(6,company);
          pst2.setString(7,username); 
        pst2.setString(8,email);
         pst2.setString(9,"upload graduation and exp document");
          pst2.setString(10,"pending");
           pst2.setString(11,"pending");
           pst2.setString(12,"pending");
           pst2.setString(13,"pending");
           pst2.setString(14,"pending");
	int i= pst2.executeUpdate();
             
      
      if(i>0){
       response.sendRedirect("vr.jsp?m1=register_success"); 
      }
      else{
          response.sendRedirect("vr.jsp?m2=add_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>
