
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
             String phone=request.getParameter("phone");
               String dob=request.getParameter("dob");
                String qualification=request.getParameter("qualification");
                String address=request.getParameter("address");
              String gender=request.getParameter("gender");
             
             
          
		try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into user(username,password,email,phone,gender,dob,qualification,address) values(?,?,?,?,?,?,?,?)");
        pst2.setString(1,username);
	pst2.setString(2,password);
        pst2.setString(3,email); 
        pst2.setString(4,phone); 
        pst2.setString(5,gender);
         pst2.setString(6,dob); 
          pst2.setString(7,qualification);
         pst2.setString(8,address); 
	int i= pst2.executeUpdate();
             
      
      if(i>0){
       response.sendRedirect("user.jsp?m1=register_success"); 
      }
      else{
          response.sendRedirect("usereg.jsp?m2=add_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
</body>
</html>
