package com.Login;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;  
import java.io.*;  
import java.sql.*;  

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driver = "com.mysql.cj.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/dos";
		
		String userid = "root";
		String password = "";
		String uid=request.getParameter("Userid");
		String pass=request.getParameter("Password");
		String utype=request.getParameter("user_type");
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try{
			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement=connection.createStatement();
			String sql ="SELECT User_id,user_password from users where User_id='"+uid+"' and user_password='"+pass+"' and user_role='"+utype+"'";
			resultSet = statement.executeQuery(sql);
			
//			response.getWriter().print("Name"+resultSet.getString("user_name")+" Role "+resultSet.getString("user_role")+" pass ="+resultSet.getString("user_password"));
			if((utype.equals("Admin"))&& (resultSet.next())){
				request.setAttribute("id",uid);
				request.getRequestDispatcher("/admin_dash.jsp").forward(request, response); 
				response.sendRedirect(request.getContextPath() + "/admin_dash.jsp");
			}
			if((utype.equals("Student"))&&(resultSet.next())){
				request.setAttribute("id",uid);
				request.getRequestDispatcher("/student_dash.jsp").forward(request, response);
				response.sendRedirect(request.getContextPath() + "/student_dash.jsp");
			}
			if((utype.equals("Faculty"))&&(resultSet.next())){
				request.setAttribute("id",uid);
				request.getRequestDispatcher("/Faculty_dash.jsp").forward(request, response);
				response.sendRedirect(request.getContextPath() + "/Faculty_dash.jsp");
			}
			
			response.getWriter().print("user does not Exist");
			
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		
//		response.getWriter().print("Name"+uid);
	}

	


}