
<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Message"%>
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
     
   
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span><i class="fa fa-check-square-o"></i></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming</a>
          <a class="dropdown-item" href="#">Data Structure</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">System Design</a>
        </div>
      </li>
      
    
       <li class="nav-item">
        <a class="nav-link" href="#"><span><i class="fa fa-user-o"></i></span>Contact</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span><i class="fa fa-asterisk"></i></span>Do Post</a>
      </li>
      
     
    
      
    </ul>
   
    <ul class="navbar-nav mr-right">
    
    <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-Modal">
        <span><i class="fa fa-user-circle"></i></span>
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
 
    <%
                
            Message ms = (Message)session.getAttribute("msg");
            if(ms!=null){
            	
            	  %>
            	  
            	     
            <div class="alert <%= ms.getCssClass() %>" role="alert">
               
               <%= ms.getContent() %>
               
            
            </div>
            
           
           
           <!-- Logout  -->  	  
            <%
            	  
            	  session.removeAttribute("msg");
            	
            }
            
            %>
 
 
 
 
 <!-- main body of page -->
 
      <main>
      
           <div class="container">
               
               <div class="row mt-4">
               
                 <!-- first col -->
                  
                   <div class="col-md-4">
                        <!-- categories -->
                
                <div class="list-group">
                
                  <a href="#" oncClick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                      All Posts
                  </a>
                 <!-- Catgeories -->
                 
                  <%
                
                 PostDao dao1 = new PostDao(ConnectionProvider.getConnection());
                 List<Category> list2  = dao1.allCategories();
                 for(Category cat : list2)
                 {
                %>
                
                  
               <a href="#" onClick="getPosts(<%= cat.getCid() %>,this)"  class="c-link list-group-item list-group-item-action">
                      <%= cat.getcName() %>
               </a>
                
                
                
                <%
                
                 }
                %>
                 
                 
                 
               </div>
                         
               
                   </div>
                   
                    <!-- second col -->
                    <div class="col-md-8" >
                        <!-- posts -->
                        
                          <div class="container text-center" id="loader" >
                              <i class="fa fa-refresh fa-3x"></i>
                              <h3 class="mt-3">Loading... </h3>
                          </div>
                          
                          <div class="container-fluid" id="post-container">
                          
                          
                          </div>
               
                    </div>
               
               
               
               </div>
           
           
           
           </div>
      
      </main>
 
 
  <!-- end body of page -->
 
 
 <!-- modal start Profile -->
 
 

<!-- Modal -->
<div class="modal fade" id="profile-Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">
            MyBlog
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="container text-center">
         <img alt="profile" src="pics/<%= user.getProfile() %> " class="img-fluid" style="border-radius: 50%;max-width: 150px;">
            <br/>
            <h5 class="modal-title mt-2" id="exampleModalLabel"><%= user.getName() %></h5>
            
            <!-- details -->
            
            <div class="container" id="profile-details">
            <table class="table">
 
  <tbody>
    <tr>
      <th scope="row">ID</th>
      <td>
         <%= user.getId() %>
      </td>
     
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row"> Gender</th>
      <td><%= user.getGender() %></td>
     
    </tr>
    <tr>
      <th scope="row"> Status</th>
      <td><%= user.getAbout() %></td>
     
    </tr>
    
     <tr>
      <th scope="row"> Registered On</th>
      <td><%= user.getDateTime() %></td>
     
    </tr>
  </tbody>
</table>
         </div>  
         
         <!-- Profile Edit -->
         
         
         <div id="profile-edit" style="display: none;">
         
         <hr/>
         
          <h3 class="mt-3">Please Edit carefully...</h3>
         
           <form action="UpdateServlet" method="post" enctype="multipart/form-data">
             
             <table class="table">
                <tr>
                   <td>
                       ID
                   </td>
                   <td>
                     <%= user.getId() %>
                   </td>
                </tr>
                
                <tr>
                   <td>
                       Email:
                   </td>
                   <td>
                      <input class="form-control" type="email" name="userEmail" value="<%= user.getEmail() %>" /> 
                   </td>
                </tr>
                
                 <tr>
                   <td>
                       Name:
                   </td>
                   <td>
                      <input class="form-control" type="text" name="userName" value="<%= user.getName() %>" /> 
                   </td>
                </tr>
                
                 <tr>
                   <td>
                       Password:
                   </td>
                   <td>
                      <input class="form-control" type="text" name="userPassword" value="<%= user.getPassword() %>" /> 
                   </td>
                </tr>
                
                <tr>
                   <td>
                       Gender
                   </td>
                   <td>
                     <%= user.getGender().toUpperCase() %>
                   </td>
                </tr>
                
                <tr>
                   <td>
                       Status:
                   </td>
                   <td>
                      <textarea class="form-control" rows="5" type="text" name="userAbout" >
                            <%= user.getAbout() %>
                      </textarea> 
                   </td>
                </tr>
                
                <tr>
                   <td>
                       New Profile Pic
                   </td>
                   <td>
                     <input type="file" name="image" class="form-control"/> 
                   </td>
                </tr>
             
             </table>
             
             <div class="container">
               <button type="submit" class="btn btn-success"> Update </button>
              </div>
           
           
           
           </form>
         
         </div>
         
         
         
         
          
         </div>   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="profile-edit-btn" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!-- ends modal profile -->
 
 
 <!-- Add post Modal -->
 
 
<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
            Provide the Post Detail
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     
     
         
         <form action="AddPostServlet" method="post" id="addPostForm">
         
            <div class="form-group"> 
              <select class="form-control" name="cid">
                <option selected="selected" disabled="disabled">--Select Category--</option>
                <%
                
                 PostDao dao = new PostDao(ConnectionProvider.getConnection());
                 List<Category> list  = dao.allCategories();
                 for(Category cat : list)
                 {
                %>
                
                  
                <option value="<%= cat.getCid() %>" ><%= cat.getcName() %></option>
                
                <%
                
                 }
                %>
                
              
              </select>
           </div>
         
         
         
            <div class="form-group">
              <input name="pTitle" type="text" placeholder="Enter the Title..." class="form-control" />
            </div>
            
            <div class="form-group">
             <textarea name="pContent" class="form-control" placeholder="Enter the Content" style="height: 200px;" ></textarea>            
            </div>
            
            <div class="form-group">
             <textarea name="pCode" class="form-control" placeholder="Enter the Program(if any)" style="height: 200px;" ></textarea>            
            </div>
            
            <div class="form-group">
            <label>Select Pic </label><br>
              <input type="file" name="pic"  />       
            </div>
            
            <div class="container text-center">
            
               <button type="submit" class="btn btn-primary">
                   Post
               </button>
            </div>
            
         
         </form>
      
      
      </div>
      
     
      
    </div>
  </div>
</div>
 

 
 <!-- end post modal -->
 
 
 

<!-- Javascript -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" 
          integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" 
   integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- my js -->
<script src="js/myjs.js" type="text/javascript"></script>

<!-- sweet alert cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" ></script>


<!-- Edit Jquery btn  -->

<script>

  $(document).ready(function(){
	  let editStatus = false;
	  
	  $('#profile-edit-btn').click(function(){
		
		  if(editStatus == false)
		    {
			  $('#profile-details').hide();
			  
			  $('#profile-edit').show(); 
			  editStatus = true;
			  
			  $(this).text("Back");
		    }
		  else
		  {
		    	$('#profile-details').show();
				  
				  $('#profile-edit').hide(); 
				  editStatus = false;
				  
				  $(this).text("Edit");
		    }
	  })	   
  });
</script>


<!-- add Post javascript -->

<script>


  $(document).ready(function(e){
	  
	 $("#addPostForm").on("submit",function(event){
		 
		 event.preventDefault();
		 console.log("submit...");
		 
		 let form = new FormData(this);
		 
		 $.ajax({
	            url: "AddPostServlet",
	            type: "POST",
	            data:  form,
	            contentType: false,
	            cache: false,
	            processData:false,
	            success: function(data){
	                console.log(data);
	                if(data.trim()){
	                	swal("Good job!", "Saved Posts !", "success");
	                }else{
	                	swal("Error!", "Something went wrong !", "warning");
	                }
	            },
	            error: function(){
	            	swal("Error!", "Something went wrong from error !", "danger");
	            }           
	        })
		 
	 })
	  
  });

</script>


<!-- load posts using ajax -->

<script>


   function getPosts(catId,temp){
	   
	   $("#loader").show();
	   $('#post-container').hide();
	   
	   $('.c-link').removeClass('active');
	   
	   
	   $.ajax({
    	   url: 'Load_Posts.jsp',
    	   data : {cid : catId},
    	   success: function (data,status,xhr) { 
    		   
    		   console.log(data);
    		   $('#loader').hide();
    		   
    		   $('#post-container').show();
    		   
    		   $('#post-container').html(data);
    		   $(temp).addClass('active');
    	   }
       })
	   
   }

     $(document).ready(function(e){
    	 
    	 //let allPostRef = $('.c-link')[0]
          
    	 getPosts(0);

     });


</script>






</body>
</html>