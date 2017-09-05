package com.entity;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Student {
	private String numberString;
	private String nameString;
	private String classString;
	private String telString;
	private String majorString;
	private String pwdString;
	
	
	public String getNumberString() {
		return numberString;
	}
	public void setNumberString(String numberString) {
		this.numberString = numberString;
	}
	public String getNameString() {
		return nameString;
	}
	public void setNameString(String nameString) {
		this.nameString = nameString;
	}
	public String getClassString() {
		return classString;
	}
	public void setClassString(String classString) {
		this.classString = classString;
	}
	public String getTelString() {
		return telString;
	}
	public void setTelString(String telString) {
		this.telString = telString;
	}
	public String getMajorString() {
		return majorString;
	}
	public void setMajorString(String majorString) {
		this.majorString = majorString;
	}
	public String getPwdString() {
		return pwdString;
	}
	public void setPwdString(String pwdString) {
		this.pwdString = pwdString;
	}
	
	public static void main(String[] args) {
		/*
		String regexPattern = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$"; 
        Pattern pattern = Pattern.compile(regexPattern);
        Matcher matcher = pattern.matcher("18810129181");
 
        System.out.println(" «∑Ò∆•≈‰:" + matcher.matches());
        */
		String regexPattern = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$"; 
		String tel = "18810191813";
		boolean matches = tel.matches(regexPattern);
		
	}
}
