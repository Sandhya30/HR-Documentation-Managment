
<%@page import="Efficient.mail"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co=null;
    String email = request.getParameter("email");
   String password = "you are selected for interview we will contact you soon";
 
    mail m= new mail();
    String msg = password;
       m.secretMail(msg, email, email);
        
   
    response.sendRedirect("student.jsp?m1=sent_mail");
  
  
%>





