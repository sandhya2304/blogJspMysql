package com.techblog.dao;

import java.sql.*;


public class LikeDao 
{
	
	Connection conn;

	public LikeDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	//save like
	public boolean insertLike(int pId,int uId)
	{
		boolean status = false;
		try
		{
			String query = "insert into liked(pid,uid) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, pId);
			ps.setInt(2, uId);
			ps.executeUpdate();
			
			status = true;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return status;
	}
	
	//count posts like
	public int countLikeOnPosts(int pId)
	{
	    int count = 0;    
		
	    try
		{
			String query = "select count(*) from liked where pid=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, pId);
			
			 ResultSet rs= ps.executeQuery();
			 
			 if(rs.next())
			 {
				 count = rs.getInt("count(*)");
			 }
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		    
	    return count;
	}
	
	//count posts like by user and if again like then dislike
	public boolean isLikedByUser(int pId,int uId)
	{
		boolean status = false;
		
		try
		{
			String query = "select * from liked where pid=? and uid =?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, pId);
			ps.setInt(2, uId);
			
			 ResultSet rs= ps.executeQuery();
			 
			 if(rs.next())
			 {
				 status = true;
			 }
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		    
		return status;
	}
	
	
	
	//delete posts like by user 
		public boolean deleteLikedByUser(int pId,int uId)
		{
			boolean status = false;
			
			try
			{
				String query = "delete from liked where pid=? and uid =?";
				PreparedStatement ps = conn.prepareStatement(query);
				ps.setInt(1, pId);
				ps.setInt(2, uId);
				
				ps.executeUpdate();
				status  = true;
				 
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			    
			return status;
		}
		
	
	
	
	
	
	

}
