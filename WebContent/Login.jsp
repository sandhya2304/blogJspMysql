<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.techblog.entities.Message"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login </title>

<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <!-- custom css -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css" />
   
    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
     <style>
      
      .banner-background{
         clip-path: polygon(30% 0%, 70% 0%, 100% 0, 98% 74%, 86% 93%, 61% 84%, 1% 100%, 0 0);
      }
    
    </style>
    
    
  
</head>
<body>

 <!-- Navbar starts -->
 
   <%@include file="Navbar.jsp" %>

 <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh;">
   <div class="container">
     <div class="row">
       <div class="col-md-4 offset-md-4">
       
          <div class="card">
            <div class="card-header primary-background text-white text-center">
            <span class="fa fa-user-plus fa-2x"></span>
            <br/>
               <p>
                  Login
               </p>
            </div>
            
            <%
                
            Message ms = (Message)session.getAttribute("msg");
            if(ms!=null){
            	
            	  %>
            	  
            	     
            <div class="alert <%= ms.getCssClass() %>" role="alert">
               
               <%= ms.getContent() %>
               
            
            </div>
            
            	  
            	  <%
            	  
            	  session.removeAttribute("msg");
            	
            }
            
            %>
         
            
            <div class="card-body">

						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> 
								<input name="email" required
									type="email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								 <input name="password" required
									type="password" class="form-control" id="password"
									placeholder="Password">
							</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
						  </div>
						
						</form>

					</div>
          
          
          </div>
       
       
       </div>
     
     
     </div>
   
   </div>
 

 </main>






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