package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.dao.UserDao;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;



@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String check = request.getParameter("check");
		out.println(check);
		
		
		if(check == null)
		{
			out.println("Please click the checkbox");
		}
		else{
			
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			
			//create user object and set all data to that object

			 User user = new User(name, email, password, gender, about);
			
			 
			 //create a user dao object
			 UserDao dao = new UserDao(ConnectionProvider.getConnection());;
			 if(dao.saveUser(user))
			 {
				 out.println("done...");
			 }else{
				 out.println("error...");
			 }
		}
		
	}

}
