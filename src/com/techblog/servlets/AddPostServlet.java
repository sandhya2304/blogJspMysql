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

import com.techblog.dao.PostDao;
import com.techblog.entities.Helper;
import com.techblog.entities.Post;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;



@MultipartConfig
public class AddPostServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		
		int cid = Integer.parseInt(request.getParameter("cid")); //category id
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		Part part = request.getPart("pic");
		
		//getting user id;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentuser");
		
		Post post = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
		
		PostDao pDao  = new PostDao(ConnectionProvider.getConnection());
		
		if(pDao.savePost(post))
		{
			
			
			String path  = request.getRealPath("/")+"blogpic"+File.separator+part.getSubmittedFileName();
			
			Helper.saveFile(part.getInputStream(), path);
			
			System.out.println("success :) ");
			
			
		}else{
			System.out.println("error :( ");
		}
		
		
	}

}
