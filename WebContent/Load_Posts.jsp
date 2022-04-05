
<%@page import="com.techblog.entities.User"%>
<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>



 
<div class="row">

<%


 Thread.sleep(500);
 PostDao pDao = new PostDao(ConnectionProvider.getConnection());

 int cid = Integer.parseInt(request.getParameter("cid"));
 
 List<Post> list = null;
 
 if(cid  == 0)
 {

    list = pDao.allPosts(); 
 
 }else{
	 list = pDao.allPosts(cid);
 }
 
 
 if(list.size() == 0)
 {
	 System.out.println("<h1>No posts... </h1>");
	 return; 
 }
 
 for(Post pp : list)
 
 {

%>

<div class="col-md-6">

    <div class="card  mt-2">
    
     <div class="card-header">
     
     
     </div>
    
     <img src="blogpic/<%= pp.getpPic() %>" class="card-img-top" alt="post pic">
      
        <div class="card-body">
           <b><%= pp.getpTitle() %></b>
           
               <hr/>
           
           <p> <%= pp.getpContent() %> </p>
           <pre> <%= pp.getpCode() %> </pre>
        </div>
        <div class="card-footer primary-background text-center">
         
          
           <%
           
           
             User uu = (User)session.getAttribute("currentuser");
             LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
            // int count = ldao.countLikeOnPosts(post.getpId());
           
           %>
           

           <a href="#!" 
              onclick="doLike(<%= pp.getpId()%>,<%= uu.getId()%>)"
              class="btn bg-light">
              <i class="fa fa-thumbs-o-up"></i>
              <span class="like-span">
               
               <%= ldao.countLikeOnPosts(pp.getpId()) %>
              
              </span>
          </a>  
          
            <a href="show-blog-posts.jsp?id=<%= pp.getpId() %>" class="btn bg-light">
              Read More...
           </a>
          
          <a href="#!" class="btn bg-light">
              <i class="fa fa-commenting-o"></i>
              <span>7</span>
          </a>  
                
        </div>

    
    </div>

</div>




<%

 }

%>

</div> 