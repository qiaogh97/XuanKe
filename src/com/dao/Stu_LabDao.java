package com.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.db.sql;
import com.entity.Stu_lab;

 
public class Stu_LabDao {
//select * from stu_lab where studentnum = 1120142000
	public ArrayList<Stu_lab> selectStu_lab1(String studentnum){
		ResultSet rs = null;
		ArrayList<Stu_lab> teacherList = new ArrayList<Stu_lab>();
		try {
			sql result = new sql();
			String temp = "SELECT * FROM Stu_lab where studentnum="+studentnum;
			result.setSqlStr(temp);
			result.executeQuery();
			rs = result.getRs();
			while (rs.next()) {
				Stu_lab stu_lab = new Stu_lab();
				stu_lab.setFlag(rs.getInt("flag"));
				stu_lab.setGrade(rs.getInt("grade"));
				stu_lab.setLabelnum(rs.getInt("labelnum"));
				stu_lab.setStudentnumString(rs.getString("studentnum"));
				teacherList.add(stu_lab);
			}
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return teacherList;
	}
//select * from stu_lab where labelnum = 1101 and flag = 0
	public ArrayList<Stu_lab> selectStu_lab2(int labelnum,int flag){
		ResultSet rs = null;
		ArrayList<Stu_lab> teacherList = new ArrayList<Stu_lab>();
		try {
			sql result = new sql();
			String temp = "SELECT * FROM Stu_lab where labelnum="+labelnum+" and flag = "+flag;
			result.setSqlStr(temp);
			result.executeQuery();
			rs = result.getRs();
			while (rs.next()) {
				Stu_lab stu_lab = new Stu_lab();
				stu_lab.setFlag(rs.getInt("flag"));
				stu_lab.setGrade(rs.getInt("grade"));
				stu_lab.setLabelnum(rs.getInt("labelnum"));
				stu_lab.setStudentnumString(rs.getString("studentnum"));
				teacherList.add(stu_lab);
			}
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return teacherList;
	}
//insert into stu_lab(studentnum,labelnum,flag) values ('1120142001', '1102', '0')
	public int insertStu_lab(String studentnum,int labelnum,int flag){
		try{
			sql result = new sql();
			String temp = "insert into stu_lab(studentnum,labelnum,flag)  values('"+studentnum+"',"+labelnum+","+flag+");";
			result.setSqlStr(temp);
			int flag1 = result.executeUpdate();
			result.close();
			if(flag1==1){
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
//update stu_lab set flag = '1' where labelnum = 1101 and studentnum = 1120142000
	public int updateStu_lab1(int labelnum,String studentnum,int flag){
		int flag1 = 0;
		try {
			sql result = new sql();
			String temp = "UPDATE stu_lab  SET flag="+flag+" where labelnum = "+labelnum+" and studentnum ='"+studentnum+"'";
			result.setSqlStr(temp);
			flag1 = result.executeUpdate();
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag1;
	}
	
	
	
//update stu_lab set grade = '90' where labelnum = 1101 and studentnum = 1120142000 
	public int updateStu_lab2(int labelnum,String studentnum,int grade){
		int flag = 0;
		try {
			sql result = new sql();
			String temp = "UPDATE stu_lab  SET grade="+grade+" where labelnum = "+labelnum+" and studentnum ='"+studentnum+"'";
			result.setSqlStr(temp);
			flag = result.executeUpdate();
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static void main(String[] args) {
		Stu_LabDao stu_LabDao = new Stu_LabDao();
		/*
//		测试selectStu_lab1方法
		ArrayList<Stu_lab> selectStu_lab1List = stu_LabDao.selectStu_lab1("1120142000");
		for(int i = 0;i<selectStu_lab1List.size();i++){
			Stu_lab stu_lab = selectStu_lab1List.get(i);
			System.out.println("成绩是："+stu_lab.getGrade());
			System.out.println("学号是："+stu_lab.getStudentnumString());
		}
		*/
//		测试selectStu_lab2方法
		ArrayList<Stu_lab> selectStu_lab1List = stu_LabDao.selectStu_lab2(1102,0);
		for(int i = 0;i<selectStu_lab1List.size();i++){
			Stu_lab stu_lab = selectStu_lab1List.get(i);
			System.out.println("成绩是："+stu_lab.getGrade());
			System.out.println("学号是："+stu_lab.getStudentnumString());
		}	
		/*
//		测试insertStu_lab方法
		int flag = stu_LabDao.insertStu_lab("1120142001", 1102, 0);
		if (flag==1) {
			System.out.println("插入成功");
		}else {
			System.out.println("插入失败");
		}
		*/
		/*
//		测试updateStu_lab1方法
		int flag = stu_LabDao.updateStu_lab1(1102, "1120142000", 1);
		if (flag==1) {
			System.out.println("更新成功");
		}else {
			System.out.println("更新失败");
		}
		*/
		/*
//		测试updateStu_lab1方法
		int flag = stu_LabDao.updateStu_lab2(1102, "1120142000", 90);
		if (flag==1) {
			System.out.println("更新成功");
		}else {
			System.out.println("更新失败");
		}
		*/
		
	}
	
	
}
