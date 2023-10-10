<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Company Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
  
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>

  <!-- =======================================================
  * Template Name: Company - v4.9.1
  * Template URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html"><span>CEH</span>Dc</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a href="uhome.jsp">Home</a></li>
          <li><a href="upload.jsp">Upload Resume</a></li>
            <li><a href="req.jsp" class="active">Requests</a></li>
          <li><a href="index.html">Logout</a></li>
        </ul>
      </nav><!-- .navbar -->

     

    </div>
      <style>
          *[role="form"] {
    max-width: 530px;
    padding: 15px;
    margin: 0 auto;
    border-radius: 0.3em;
    background-color: #f2f2f2;
}

*[role="form"] h2 { 
    font-family: 'Open Sans' , sans-serif;
    font-size: 40px;
    font-weight: 600;
    color: #000000;
    margin-top: 5%;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 4px;
}
      </style>
       <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('documents sent successfully');</script>
        <%}%>
         <%
            if (request.getParameter("msg1") != null) {%>
        <script>alert('failed');</script>
        <%}%>
  </header><!-- End Header -->
  <%
      
     //  String username=session.getAttribute("username").toString();
      %>
  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <div class="carousel-inner" role="listbox">
            <%
  
        String username=session.getAttribute("username").toString();
         
try{
   
        Connection co = databasecon.getconnection();
        PreparedStatement pst=co.prepareStatement("select * from request where username='"+username+"' ");
        ResultSet rs=pst.executeQuery();
      
    %>
 <br><br><br><br><br>
<center><h2 style="color:black;font-size: 20px;"><b>View Request</b></h2></center>
<center>
    <table  style="width:70%;">
  <thead style="background-color: pink;">
    <tr>
        <th style="text-align:center" scope="col" >Hr</th>
        <th style="text-align:center" scope="col" >About</th>
        <th style="text-align:center" scope="col" >Company</th>
         <th style="text-align:center" scope="col" >Documents</th>
          <th style="text-align:center" scope="col" >Upload Document</th>
    </tr>
  </thead>
  <tbody style="text-align: center;">
       <%  while(rs.next()){
       %>
    <tr  style="background: rgba(0,0,0,0.5); color: wheat" >
      
      <td><%=rs.getString(1)%></td>
      <td><%=rs.getString(5)%></td>
      <td><%=rs.getString(6)%></td>
      <td><%=rs.getString(9)%></td>
       <td style="color:whitesmoke"><button class="btn btn-secondary"><a href="req1.jsp?hr=<%=rs.getString(1)%>&languages=<%=rs.getString(2)%>&exp=<%=rs.getString(4)%>&company=<%=rs.getString(6)%>"><b>Upload</b></a></button> </td>
    </tr>
    <%}%>
  </tbody>
</table>
</center>  
    <% 
}
      	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
       


    </div>
  </section><!-- End Hero -->

    <!-- ======= About Us Section ======= -->
 
    <!-- ======= Services Section ======= -->
  
    

 
  

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>