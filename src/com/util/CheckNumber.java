package com.util;

import java.util.ArrayList;

import com.dao.StudentDao;
import com.dao.TeacherDao;
import com.entity.Student;
import com.entity.Teacher;

public class CheckNumber {
	public static boolean checkStudent(String number){
		StudentDao studentDao = new StudentDao();
		ArrayList<Student> selectStudent = studentDao.selectStudent(number);
		if (selectStudent.size()==0) {
			return false;
		}else {
			return true;
		}
	}
	public static boolean checkTeacher(String number){
		TeacherDao teacherDao = new TeacherDao();
		ArrayList<Teacher> selectTeacher = teacherDao.selectTeacher(number);
		if (selectTeacher.size()==0) {
			return false;
		}else {
			return true;
		}
	}
	public static void main(String[] args) {
		boolean checkStudent = CheckNumber.checkStudent("1120142000");
		if (checkStudent) {
			System.out.println("³É¹¦£¡");
		}else {
			System.out.println("Ê§°Ü£¡");
		}
	}
}
