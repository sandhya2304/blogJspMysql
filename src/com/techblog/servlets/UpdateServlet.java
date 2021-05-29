package com.techblog.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.techblog.dao.UserDao;
import com.techblog.entities.Helper;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;



@MultipartConfig
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		
		
		//fetch all data;
		
		String email = request.getParameter("userEmail") ;
		String name = request.getParameter("userName") ;
		String password = request.getParameter("userPassword") ;
		String about = request.getParameter("userAbout") ;
		
		//file uploading
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();
		
		//get the user from the session
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentuser");
		
		//set new update data
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setAbout(about);
		
		String oldFile = user.getProfile();
		
		user.setProfile(imageName);
		
		//update data in database
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean b = dao.updateUser(user);
		
		if(b)
		{
			System.out.println("user update");
		
			String path  = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			
			
			//path old file
			String oldPath  = request.getRealPath("/")+"pics"+File.separator+oldFile;
			
			if(!oldFile.equals("default.png"))
			{
			  Helper.deleteFile(oldPath);
			}
				if(Helper.saveFile(part.getInputStream(), path)){
					System.out.println("profile update");
					
					Message msg = new Message("profile details update", "success","alert-success");
					
					session.setAttribute("msg", msg);
					
					
				}else{
					System.out.println("profile img not update");
					
                     Message msg = new Message("something went wrong...profile not update", "error","alert-danger");
					
					session.setAttribute("msg", msg);
				}
					
		}else{
			System.out.println("Try again!!!");
			

            Message msg = new Message("something went wrong...profile not update", "error","alert-danger");
			
			session.setAttribute("msg", msg);
		}
		
		response.sendRedirect("Profile.jsp");
		
	}

}
