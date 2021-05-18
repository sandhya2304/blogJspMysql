
<%@page isErrorPage="true" %>

<html>
<title>Something went wrong!!</title>


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
    
    <body>
    
    <div class="container text-center">
      <img alt="error" src="images/error.png" class="img-fluid">
      
      <h3 class="display-3">Something went wrong...</h3>
      
      <%= exception %>
      
      <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">
         Home
      </a>
    
    </div>
    
    
    
    
    </body>
</html>