package com.Login;

import java.sql.*;
import java.util.*;

public class ResultS{
	
	String JdbcURL = "jdbc:mysql://localhost:3306/dos";
    String Username = "root";
    String password = "";
    Connection con = null;
    ResultSet rs=null;
    Statement stmt = null;
    String query=null;
    
    public ResultS(String query1){
		this.query=query1;
	
	}
    public ResultSet Connection_Result() throws SQLException {
    	 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
    	 con = DriverManager.getConnection(JdbcURL, Username, password);
    	 System.out.println("Connection is successful!!!!!!");
    	    stmt = con.createStatement();
    	    return stmt.executeQuery(this.query);
    
    }
    
//    public static void main(String[] args) throws SQLException {
//    	ResultS ts=new ResultS("SELECT sub_name,t_name,faculty.email,faculty.contact FROM subject,faculty,stu_teacher WHERE faculty.t_id=subject.t_id and stu_teacher.t_id=faculty.t_id and stu_teacher.s_id =(select s_id from student where user_id=10001)");	
//    	ResultSet rs=ts.Connection_Result();
//    	while(rs.next()) {
//			System.out.println(rs.getString("t_name")); 
//			System.out.println(rs.getString("email"));
//			System.out.println(rs.getString("contact")); 
//		 }
//		 
//  }
}  
