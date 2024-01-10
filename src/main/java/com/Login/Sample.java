package com.Login;

import java.sql.*;

public  class Sample {
	String  query=null;
	String[] arr;
	int size;
	public  Sample(String query1,String[] arr1,int size1){
		this.query=query1;
		this.arr=arr1;
		this.size=size1;
	}

	
	public  String[] Connection_Query(){
		String JdbcURL = "jdbc:mysql://localhost:3306/dos";
	      String Username = "root";
	      String password = "";
	      Connection con = null;
	      ResultSet rs=null;
	      Statement stmt = null;
	      String[] rsOp=new String[this.size];
	      try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try {
	         System.out.println("Connecting to database..............."+JdbcURL);
	         con=DriverManager.getConnection(JdbcURL, Username, password);
	         System.out.println("Connection is successful!!!!!!");
	         stmt = con.createStatement();
	          rs = stmt.executeQuery(this.query);
	          
	          while (rs.next()) {
	        	  for(int i=0;i<this.arr.length;i++) {
	        		  rsOp[i]=rs.getString(this.arr[i]);
	        	  }
	        	  
	        	 
	          }
	          rs.close();
	          con.close();
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	      }
	      return rsOp;
	}

	
	
//	public static void main(String[] args) {
//		int userid=10001;
//		System.out.print("hel");
//		String sq1="SELECT t_name,faculty.email,faculty.contact from stu_teacher,faculty,student where stu_teacher.t_id=faculty.t_id and stu_teacher.s_id=student.s_id and student.s_id = (select s_id from student where user_id='"+userid+"');"; 
//		String[] arr1 = {"t_name","email","contact"}; 
//		Sample s1=new Sample(sq1,arr1,arr1.length);
//		String[][] rq1=s1.Connection_Query_2d();
//		 for(int i=0;i<rq1.length;i++) {
//			 for(int j=0;j<arr1.length;j++) {
//				 System.out.println("hello");
//			 }
//
//		 }
//		 
//
//	}

}