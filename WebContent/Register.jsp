<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register </title>

<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <!-- custom css -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css" />
   
    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
   
</head>
<body>

<!-- Navbar starts -->
 
   <%@include file="Navbar.jsp" %>
    
    <main class="primary-background p-5" style="padding-bottom: 50px;">
      
      <div class="container">
         <div class="col-md-6 offset-md-3">
          
           <div class="card">
             <div class="card-header text-center primary-background text-white" >
             <span class="fa fa-user-circle fa-2x"></span><br>
                Register
             </div>
             
             <div class="card-body">

					<form action="RegisterServlet" method="post">
					
					<div class="form-group">
							<label for="user_name">User Name</label> 
							<input name="user_name"
							 type="text" class="form-control" id="user_name"
								 placeholder="Enter user name">
							
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> 
							<input name="user_email"
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter email">
							<small id="emailHelp" class="form-text text-muted">We'll
								never share your email with anyone else.</small>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
							name="user_password"	type="password" class="form-control" id="exampleInputPassword1" />
							
						</div>
						
						<div class="form-group">
						 
						   <textarea  rows="5" cols="20" name="about" class="form-control" 	placeholder="Enter Something About Yourself..."></textarea>
						 
						</div>
						
							<div class="form-group">
							   	<label for="gender">Select Gender :</label><br/>
							   	<input
								type="radio"  id="gender"
								name="gender" value="male"> Male
									<input
								type="radio"  id="gender"
								name="gender" value="female"> Female
							   	
						   </div>
						
						
						<div class="form-check">
							<input name="check" type="checkbox" class="form-check-input"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1">Agree Terms and condition</label>
						</div>
						
						<br/>
						
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>

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
