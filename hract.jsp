
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co=null;
    String username = request.getParameter("username");
    String password = request.getParameter("password");
   
    try{
       
    co = databasecon.getconnection();
    Statement st = co.createStatement();
    ResultSet rs = st.executeQuery("select * from hr where username= '"+username+"' and password='"+password+"' ");
    if(rs.next())
    {
     session.setAttribute("username", username);
    
     
     String email=rs.getString("email");
     session.setAttribute("email", email);
     
      String company=rs.getString("company");
     session.setAttribute("company", company);
    
    response.sendRedirect("hrhome.jsp?msg=Login_Successfull");
    }
    else 
    {
    response.sendRedirect("hr.jsp?msg1=LoginFail");
    }
    }
    catch(Exception e)
    {
    System.out.println("Error in cloudlogact"+e.getMessage());
    }
%>





