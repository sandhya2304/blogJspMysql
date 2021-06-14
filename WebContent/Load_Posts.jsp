


<%@page import="java.util.List"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>


<div class="row">

<%

 PostDao pDao = new PostDao(ConnectionProvider.getConnection());
 List<Post> list = pDao.allPosts(); 
 
 for(Post pp : list)
 
 {

%>

<div class="col-md-6">

    <div class="card  mt-2">
    
     <img src="blogpid/<%= pp.getpPic() %>" class="card-img-top" alt="post pic">
      
        <div class="card-body">
           <b><%= pp.getpTitle() %></b>
           <p> <%= pp.getpContent() %> </p>
           <pre> <%= pp.getpCode() %> </pre>
        </div>
    
    
    </div>

</div>




<%

 }

%>

</div> 