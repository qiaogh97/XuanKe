package com.db;

import java.sql.*;

public class DBHelper {	
	private String driverName = "com.mysql.jdbc.Driver"; 
	private String url = "jdbc:mysql://localhost:3306/shiyan";
	private String user = "root";
	private String password = "root";
	public void setDriverName(String newDriverName) 
	{
        this.driverName = newDriverName;
    }
    public String getDriverName()
    {
        return driverName;
    }
	public void setUrl(String newUrl) 
	{
	    this.url = newUrl;
	}
	public String getUrl() 
	{
		return url;
	}
	public void setUser(String newUser) 
	{
	    this.user = newUser;
	}
	public String getUser() 
	{
	    return user;
	}
	public void setPassword(String newPassword)
	{
	   this.password = newPassword;
	}
	public String getPassword() 
	{
	   return password;
	}
	public Connection getConnection() 
	{
	     try
	     {
	         Class.forName(driverName);
	         return DriverManager.getConnection(url, user, password);
	     }
	     catch (Exception e) 
	     {
	            e.printStackTrace();
	            return null;
       	 }
   	}
	
}
