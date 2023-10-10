
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>

<html>
<body>
<%
   Connection co = null;
            String username=request.getParameter("username");
             String company=request.getParameter("company");
            String language=request.getParameter("language");
            String qualification=request.getParameter("qualification");
              String exp=request.getParameter("exp");
             String about=request.getParameter("about");
             
             
          
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into jobs(username,language,qualification,exp,about,company) values(?,?,?,?,?,?)");
        pst2.setString(1,username);
	pst2.setString(2,language);
        pst2.setString(3,qualification); 
        pst2.setString(4,exp); 
        pst2.setString(5,about);
         pst2.setString(6,company);
	int i= pst2.executeUpdate();
             
      
      if(i>0){
       response.sendRedirect("addjobs.jsp?m1=register_success"); 
      }
      else{
          response.sendRedirect("addjobs.jsp?m2=add_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>
