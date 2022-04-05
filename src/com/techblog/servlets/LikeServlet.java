package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.dao.LikeDao;
import com.techblog.helper.ConnectionProvider;


public class LikeServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out  = response.getWriter();
		try
		{
			
			// fetching data from ajax
		String operation = request.getParameter("operation");
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		out.println(operation +" from server " +pid + " " + uid);
		LikeDao dao = new LikeDao(ConnectionProvider.getConnection());
		if(operation.equals("like"))
		{
			boolean check = dao.insertLike(pid, uid);
			out.print(check);
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
