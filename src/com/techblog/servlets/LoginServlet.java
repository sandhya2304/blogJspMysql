package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.dao.UserDao;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;



public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	 throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		
		//fetch username and password
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User user = dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(user == null)
		{
			out.println("Invalid Details...Try Again!!!");
		}else{
			HttpSession s = request.getSession();
			s.setAttribute("currentuser", user);
			response.sendRedirect("Profile.jsp");
		}
		
	}

}
