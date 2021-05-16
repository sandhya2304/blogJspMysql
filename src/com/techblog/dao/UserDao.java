package com.techblog.dao;
import java.sql.*;

import com.techblog.entities.User;



public class UserDao
{
	
	private Connection conn;

	public UserDao(Connection conn) {
		this.conn = conn;
	}
	
	
	//insert user data
	
	public boolean saveUser(User user)
	{
		boolean status = false;
		
		try
		{		
			
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			
			PreparedStatement ps = this.conn.prepareStatement(query);
			ps.setString(1,user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.executeUpdate();
			
			status = true;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
		
		
	}
	
	
	
	
	

}
