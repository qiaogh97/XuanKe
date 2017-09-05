package com.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.db.sql;
import com.entity.Label;

public class LabelDao {
	public int insertLabel(String name, String term, String teachernum,
			String teachername, String place, int maxnum, String content,
			String time, int score, String studytime) {
		try {
			sql result = new sql();
			String temp = "insert into label(name,term,teachernum,teachername,place,maxnum,content,time,score,studytime) values('"
					+ name
					+ "','"
					+ term
					+ "','"
					+ teachernum
					+ "','"
					+ teachername
					+ "','"
					+ place
					+ "',"
					+ maxnum
					+ ",'"
					+ content
					+ "','"
					+ time
					+ "',"
					+ score
					+ ",'"
					+ studytime
					+ "')";
			result.setSqlStr(temp);
			int flag = result.executeUpdate();
			result.close();
			if (flag == 1) {
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<Label> selectLabel(String teachernum, int labelnum) {
		ResultSet rs = null;
		ArrayList<Label> labelList = new ArrayList<Label>();
		try {
			sql result = new sql();
			String temp = "";
			if (teachernum == null && labelnum == -1) {
				temp = "SELECT * FROM label";
			} else if (teachernum != null) {
				temp = "SELECT * FROM label where teachernum=" + teachernum;
			} else {
				temp = "SELECT * FROM label where number=" + labelnum;
			}
			result.setSqlStr(temp);
			result.executeQuery();
			rs = result.getRs();
			while (rs.next()) {
				Label label = new Label();
				label.setNumber(rs.getInt("number"));
				label.setNameString(rs.getString("name"));
				label.setTermString(rs.getString("term"));
				label.setTeachernumString(rs.getString("teachernum"));
				label.setTeachernameString(rs.getString("teachername"));
				label.setPlaceString(rs.getString("place"));
				label.setMaxnum(rs.getInt("maxnum"));
				label.setNownum(rs.getInt("nownum"));
				label.setContentString(rs.getString("content"));
				label.setTimeString(rs.getString("time"));
				label.setScore(rs.getInt("score"));
				label.setStudytimeString(rs.getString("studytime"));
				labelList.add(label);
			}
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return labelList;
	}

	public int updateLabelNowtime(int number, int nownum) {
		int flag = 0;
		try {
			sql result = new sql();
			String temp = "UPDATE label  SET nownum=" + nownum
					+ " WHERE number=" + number;
			result.setSqlStr(temp);
			flag = result.executeUpdate();
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static void main(String[] args) {
		LabelDao labelDao = new LabelDao();

		/*
		int flag = labelDao.insertLabel("实验课2", "2017年春季", "10002", "张兰", "3教404", 50, "很好", "32", 2,"周日上午八点");
		if(flag==1){
			System.out.println("插入成功");
		}else {
			System.out.println("插入失败");
		}
		*/
		 // 测试selectlabel方法 
		ArrayList<Label> selectLabel = labelDao.selectLabel(null,1102); 
		 for(int i = 0;i<selectLabel.size();i++){ Label label = selectLabel.get(i);
		 	System.out.println(label.getContentString());
		 	System.out.println(label.getMaxnum()+"");
		 }
		/*
		 * // 测试updateLabelNowtime方法 int flag =
		 * labelDao.updateLabelNowtime(1102, 25); if (flag==1) {
		 * System.out.println("更新成功"); }else { System.out.println("更新失败"); }
		 */
		 
	}
}
