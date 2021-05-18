

<%@page import="com.techblog.entities.User"%>
<%@page errorPage="Error.jsp" %>

<%

 User user = (User)session.getAttribute("currentuser");

if(user == null){
	response.sendRedirect("Login.jsp");
}

%>


Name: <%= user.getName() %> <br/>
Email: <%= user.getEmail() %>