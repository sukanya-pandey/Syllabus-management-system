package com.Login;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class RSmap2 {
	String driver = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/dos";
	String userid = "root";
	String password = "";
	String uid="10001";
	String pass="Richa123";
	String utype="Student";
	public void GetResultMap() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try{
			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement=connection.createStatement();
			String sql ="SELECT User_id,user_password from users where User_id='"+uid+"' and user_password='"+pass+"' and user_role='"+utype+"'";
			resultSet = statement.executeQuery(sql);
			
	//		response.getWriter().print("Name"+resultSet.getString("user_name")+" Role "+resultSet.getString("user_role")+" pass ="+resultSet.getString("user_password"));
			if((utype.equals("Admin"))&& (resultSet.next())){
				System.out.println("Admin here");
			}
			else if((utype.equals("Student"))&&(resultSet.next())){
				System.out.println("Student here");
			}
			else if((utype.equals("Faculty"))&&(resultSet.next())){
				System.out.println("Faculty here");
			}	
			else {
				System.out.println("Not exist");
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
	}
//	response.getWriter().print("Name"+uid);
}
	


public class Practice {

	public static void main(String[] args) throws SQLException {
		
			RSmap2 rs=new RSmap2();
			rs.GetResultMap();
	}

}
