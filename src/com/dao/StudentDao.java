package com.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.db.sql;
import com.entity.Student;

public class StudentDao {
	public int insertStudent(String number,String name, String className, String tel, String major, String pwd){
		/**
		 * 学生表中插入新的学生
		 * @param number,name,className,tel,major,pwd 都是待插入的字段
		 */
		int flag = 0;
		try{
			sql result = new sql();
			String temp = "INSERT INTO student VALUES('"+number+"','"+name+"','"+className+"','"+tel+"','"+major+"','"+pwd+"')";
			result.setSqlStr(temp);
			flag = result.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	public ArrayList<Student> selectStudent(String number){
		ResultSet rs = null;
		ArrayList<Student> studentList = new ArrayList<Student>();
		try {
			sql result = new sql();
			String temp = "SELECT * FROM student where number="+number;
			result.setSqlStr(temp);
			result.executeQuery();
			rs = result.getRs();
			while (rs.next()) {
				Student student = new Student();
				student.setMajorString(rs.getString("number"));
				student.setNameString(rs.getString("name"));
				student.setNumberString(rs.getString("class"));
				student.setNumberString(rs.getString("tel"));
				student.setPwdString(rs.getString("major"));
				student.setTelString(rs.getString("pwd"));
				studentList.add(student);
			}
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentList;
	}
	public int login(String number,String pwd){
		ResultSet rs = null;
		try{
			sql result = new sql();
			String temp = "select * from student   where( number='"+number+"');";
			result.setSqlStr(temp);
			result.executeQuery();
			rs = result.getRs();
			rs.next();
			String pwd2 = rs.getString("pwd");
			result.close();
			if(pwd2.equals(pwd)){
				return 1;
			}
			else{
				return 0;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public int updateStudent(String number,String name, String className, String tel, String major, String pwd){
		/**
		 * 更新学生信息
		 * @param number 待更新学生的学号
		 * @param name 待更新学生的姓名...
		 */
		int flag = 0;
		try{
			sql result = new sql();
			String temp = "UPDATE student SET name = '"+name+"'," +
					"class = '"+className+"'," +
					"tel = '"+tel+"'," +
					"major = '"+major+"'," +
					"pwd ='"+pwd+"' " +
					"WHERE number = '"+number+"'";
			result.setSqlStr(temp);
			flag = result.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	public static void main(String[] args) {
		StudentDao studentDao = new StudentDao();
		/*
//		测试insertStudent方法
		int flag = studentDao.insertStudent("1120142001", "汪峰", "08311402", "18819182911", "软件工程", "000000");
		if (flag==1) {
			System.out.println("插入成功");
		}else {
			System.out.println("插入失败");
		}
		*/
		/*
//		测试updatestudent方法
		int flag = studentDao.updateStudent("1120142000", "张强", "08311402", "1881018192", "软件工程", "000000");
		if (flag==1) {
			System.out.println("更新成功");
		}else {
			System.out.println("更新失败");
		}
		*/
		/*
//		测试login方法
		int flag = studentDao.login("1120142000", "000000");
		if (flag==1) {
			System.out.println("登录成功");
		}else {
			System.out.println("登录失败");
		}
		*/
	}
}