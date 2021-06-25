
<%@page import="java.util.List"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>


<div class="row">

<%


Thread.sleep(50);
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
    
     <img src="blogpic/<%= pp.getpPic() %>" class="card-img-top" alt="post pic">
      
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