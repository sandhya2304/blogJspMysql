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
	
	//get user by email and password
	
	public User getUserByEmailAndPassword(String email,String password){
		User user = null;
		
		try
		{
			String query = "select * from user where email =? and password =?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2,password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				user = new User();
				
				//data from db
				String name = rs.getString("name");
				user.setName(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return user;
	}
	
	//update the user
	
	public  boolean updateUser(User user)
	{
		boolean status = false;
		
		try
		{
			String query = "update user set name=?,email=?,password=?,about=?,gender=?,profile=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getAbout());
			ps.setString(5, user.getGender());
			ps.setString(6, user.getProfile());
			ps.setInt(7, user.getId());
			
			ps.executeUpdate();
			status  = true;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	
	
	
	
	
	

}
