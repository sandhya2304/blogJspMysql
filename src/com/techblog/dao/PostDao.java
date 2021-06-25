package com.techblog.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.techblog.entities.Category;
import com.techblog.entities.Post;
import com.techblog.entities.User;

public class PostDao
{
		
	private Connection conn;

	
	public PostDao(Connection conn) {
		super();
		this.conn = conn;
	}





	public ArrayList<Category> allCategories()
	{
		ArrayList<Category> list = new ArrayList<Category>();
			
		try
		{
			String query = "select * from categories";
			Statement ps = this.conn.createStatement();
			ResultSet rs = ps.executeQuery(query);
			 while(rs.next())
			 {
				 int cid = rs.getInt("cid");
				 String name = rs.getString("cname");
				 String desc = rs.getString("description");
				 
				 Category cat = new Category(cid, name, desc);
				 
				 list.add(cat);
			 }
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;		
	}
	
	
	public List<Post> allPosts()
	{
		
		List<Post> list = new ArrayList<>();
		
		
		try
		{
			
			String query = "select * from posts order by pid desc";
			Statement ps = this.conn.createStatement();
			ResultSet rs = ps.executeQuery(query);
			while(rs.next())
			{
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int catId = rs.getInt("catId");
				int userid = rs.getInt("userId");
				
				Post pp = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userid);
				list.add(pp);
				
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();			
		}
		return list;	
	}
	
	
	
	public List<Post> allPosts(int catId)
	{
		
		List<Post> list = new ArrayList<>();
		
		try
		{
			
			// showing error in this code
			String query = "select * from posts where catId = ?";
			PreparedStatement ps = this.conn.prepareStatement(query);
			ps.setInt(1, catId);
			
			ResultSet rs = ps.executeQuery(query);
			while(rs.next())
			{
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate"); 				
				int userid = rs.getInt("userId");
				
				
				Post pp = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userid);
				list.add(pp);
				
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();			
		}
		return list;
		
	}
	
	
	
	
	
	
	//save post 
	
	//insert user data
	
		public boolean savePost(Post post)
		{
			boolean status = false;
			
			try
			{		
				
				String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
				
				PreparedStatement ps = this.conn.prepareStatement(query);
				ps.setString(1,post.getpTitle());
				ps.setString(2, post.getpContent());
				ps.setString(3, post.getpCode());
				ps.setString(4, post.getpPic());
				ps.setInt(5, post.getCatId());
				ps.setInt(6, post.getUserId());
				
				ps.executeUpdate();
				
				status = true;
				
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return status;
			
			
		}
		
	
	
	
	
	
	
	
	
	
	
	
	

}
