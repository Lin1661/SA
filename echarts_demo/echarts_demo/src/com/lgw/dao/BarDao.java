package com.lgw.dao;

import java.sql.*;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.lgw.bean.Bar;

public class BarDao {
	String url="jdbc:sqlserver://localhost:1433; DatabaseName=EDUC";
	String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";    
	Connection con;
	public String query() {
		ArrayList<Bar> barArr = new ArrayList<Bar>();
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, "sa", "123456");
			System.out.println("数据库连接成功");
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM table student");
			ResultSet rs = stmt.executeQuery();

			while(rs.next()) {
				Bar bar = new Bar();
				bar.setName(rs.getString("sno"));
				bar.setNum(rs.getInt("age"));
								barArr.add(bar);
			}
			con.close();
		} catch (SQLException e) {
			System.out.println("驱动加载失败");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("数据库连接失败");
			e.printStackTrace();
		}
		Gson gson =new Gson();
		String str=gson.toJson(barArr);
		
		return str;
	}
	public void update(String sno,Integer age) {
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(
					url, "sa", "123456");
			System.out.println("数据库连接成功");
			PreparedStatement stmt = con.prepareStatement("update student set age='"+age+"' where sno='"+sno+"'");
			stmt.executeUpdate();	
			con.close();
		} catch (SQLException e) {
			System.out.println("驱动加载失败");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("数据库连接失败");
			e.printStackTrace();
		}
	}
}
