
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>

<html>
<body>
<%
   Connection co = null;
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String email=request.getParameter("email");
              String company=request.getParameter("company");
             String phone=request.getParameter("phone");
              String gender=request.getParameter("gender");
             
             
          
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into hr(username,password,email,company,phone,gender) values(?,?,?,?,?,?)");
        pst2.setString(1,username);
	pst2.setString(2,password);
        pst2.setString(3,email); 
        pst2.setString(4,company); 
        pst2.setString(5,phone);
         pst2.setString(6,gender); 
	int i= pst2.executeUpdate();
             
      
      if(i>0){
       response.sendRedirect("hr.jsp?m1=register_success"); 
      }
      else{
          response.sendRedirect("hrreg.jsp?m2=add_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>
