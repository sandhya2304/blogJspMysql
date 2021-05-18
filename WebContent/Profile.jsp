

<%@page import="com.techblog.entities.User"%>
<%@page errorPage="Error.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Blog</title>

<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <!-- custom css -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css" />
   
    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- clip path -->
    <style>
      
      .banner-background{
         clip-path: polygon(30% 0%, 70% 0%, 100% 0, 98% 74%, 86% 93%, 61% 84%, 1% 100%, 0 0);
      }
    
    </style>

</head>
<body>

<%

 User user = (User)session.getAttribute("currentuser");

if(user == null){
	response.sendRedirect("Login.jsp");
}

%>

<!-- navbar Starts -->



   <nav class="navbar navbar-expand-lg navbar-dark primary-background ">
  <a class="navbar-brand" href="index.jsp">
   <span><i style="font-size:24px" class="fa">&#xf069;</i>
   </span>
    Blog
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><i class="fa fa-bell-o"></i>
        <span>Learning with Sandhuya <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span><i class="fa fa-user-o"></i></span>Contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span><i class="fa fa-check-square-o"></i></span> Catgeories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming</a>
          <a class="dropdown-item" href="#">Data Structure</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">System Design</a>
        </div>
      </li>
      
    
    
      
    </ul>
   
    <ul class="navbar-nav mr-right">
    
    <li class="nav-item">
        <a class="nav-link" href="Register.jsp"><span><i class="fa fa-user-circle"></i></span>
          <%= user.getName() %>
        </a>
      </li>
    
       <li class="nav-item">
        <a class="nav-link" href="LogoutServlet">
        <span><i class="fa fa-user"></i></span>
        Logout</a>
      </li>
    
    </ul>
   
   
  </div>
</nav>
 
 <!-- Navbar ends -->
 
 
 
 

<!-- Javascript -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" 
          integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" 
   integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- my js -->
<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>