package com.Login;
import java.sql.*;
import java.util.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class FlagServlet
 */
public class FlagServlet extends HttpServlet {
		static final String DB_URL = "jdbc:mysql://localhost:3306/dos";
	   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject=request.getParameter("Subject");
		String topic=request.getParameter("topic");
		String subtopic=request.getParameter("subtopic");
		 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		try{
			Connection conn = DriverManager.getConnection(DB_URL,"root","");
		         Statement stmt = conn.createStatement();	               
		         String sql = "INSERT INTO flag_doubt VALUES ('"+subject+"', '"+topic+"', '"+subtopic+"')";
		         stmt.executeUpdate(sql);
		 		request.setAttribute("msg","Flag done");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("student_dash.jsp");
				requestDispatcher.forward(request, response);
		      } catch (SQLException e) {
		         e.printStackTrace();
		 		request.setAttribute("msg","Flag failed");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("student_dash.jsp");
				requestDispatcher.forward(request, response);
		      } 
	}

	

}