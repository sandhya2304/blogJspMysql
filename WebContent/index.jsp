<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
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

 <!-- Navbar starts -->
 
   <%@include file="Navbar.jsp" %>
 
 <!-- Navbar Ends -->
 
 <!-- banner -->
 
 <div class="container-fluid p-0 m-0">
 
    <div class="jumbotron primary-background banner-background">
     <div class="container">
      
       <h3 class="display-3">Technical Blog</h3>
       <p>
          Learning technology with new ways!!
          A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. 
          Programming languages are used in computer programming to implement algorithms. Most programming languages consist of 
          instructions for computers.
       </p>
       
       <button class="btn btn-primary btn-lg text-white">
        <span class="fa fa-external-link"></span>
          Starts its free
       </button>
       
       &nbsp;
       
         <a href="Login.jsp" class="btn btn-success btn-lg text-white" >
           <span class="fa fa-user-plus "></span>
          Login
       </a>
       
       </div>
    </div>
    
    <br/>
    
   
 </div>
 
 
 
    
  <div class="container">
     
      <div class="row mb-2">
      
         <div class="col-md-4">

                <!-- card   -->

				<div class="card">
					
					<div class="card-body">
						<h5 class="card-title">Java Programming </h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read More</a>
					</div>
				</div>

			</div>
			
			 <div class="col-md-4">

                <!-- card   -->

				<div class="card">
					
					<div class="card-body">
						<h5 class="card-title">Java Programming </h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read More</a>
					</div>
				</div>

			</div>
      
      
      
         <div class="col-md-4">

                <!-- card   -->

				<div class="card">
					
					<div class="card-body">
						<h5 class="card-title">Java Programming </h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read More</a>
					</div>
				</div>

			</div>
      
      
      </div>
      
      <!-- second Row -->
      
      <div class="row">
      
         <div class="col-md-4">

                <!-- card   -->

				<div class="card">
					
					<div class="card-body">
						<h5 class="card-title">Java Programming </h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read More</a>
					</div>
				</div>

			</div>
			
			 <div class="col-md-4">

                <!-- card   -->

				<div class="card">
					
					<div class="card-body">
						<h5 class="card-title">Java Programming </h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read More</a>
					</div>
				</div>

			</div>
      
      
      
         <div class="col-md-4">

                <!-- card   -->

				<div class="card">
					
					<div class="card-body">
						<h5 class="card-title">Java Programming </h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read More</a>
					</div>
				</div>

			</div>
      
      
      </div>
    
  </div>
 
 

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