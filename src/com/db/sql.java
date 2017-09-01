package com.db;
import java.sql.*;

public class sql{

	protected Connection conn = null;	
	protected Statement stmt = null;	
	protected ResultSet rs = null;		
	protected String sqlStr;
	
	public sql() 
	{
		try
		{
			sqlStr = "";
			DBHelper dcm = new DBHelper();
			conn = dcm.getConnection();
			stmt = conn.createStatement();
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		
	}

	public Statement getStmt() 
	{
		return stmt;
	}
	public Connection getConn() 
	{
		return conn;
	}
	public ResultSet getRs() 
	{
		return rs;
	}
	public void setSqlStr(String newSqlStr) 
	{
		this.sqlStr=newSqlStr;
	}
	public String getSqlStr() 
	{
		return sqlStr;
	}
	public void executeQuery() throws Exception  {
		rs = stmt.executeQuery(sqlStr);
	}
	public int executeUpdate()  {
		try{
		return stmt.executeUpdate(sqlStr);
		}catch(SQLException e)
		{
			System.out.println(e.getMessage());
			return 0;
		}
	}
	public void close() throws SQLException 
	{
		if ( stmt != null ) 
		{
			stmt.close();
			stmt = null;
		}
		conn.close();
		conn = null;
	}
};
