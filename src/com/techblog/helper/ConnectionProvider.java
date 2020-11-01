package com.techblog.helper;

import java.sql.*;


public class ConnectionProvider
{
	
	private static Connection connection;
	
	public static Connection getConnection() {
			
			try
			{
				if(connection == null){
					Class.forName("com.mysql.jdbc.Driver");  
					connection=DriverManager.getConnection("jdbc:mysql://localhost/techblog","root","");  
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
	
		return connection;
	}

}
