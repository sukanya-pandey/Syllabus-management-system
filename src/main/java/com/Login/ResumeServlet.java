package com.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

/**
 * Servlet implementation class ResumeServlet
 */
public class ResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String DOB=request.getParameter("DOB");
		String age=request.getParameter("age");
		String phone=request.getParameter("phone");
		String LinkedIn=request.getParameter("LinkedIn");
		String Address=request.getParameter("Address");
		String About=request.getParameter("About");
		String Education=request.getParameter("Education_no");
		int exp_no=Integer.parseInt(Education);
		//Educational Details
		String[] courses=new String[exp_no];
		String[] percentage=new String[exp_no];
		String[] board=new String[exp_no];
		String[] year=new String[exp_no];
		for(int i=0;i<exp_no;i++) {
			courses[i]=request.getParameter("course'"+i+"'");
			percentage[i]=request.getParameter("percentage'"+i+"'");
			board[i]=request.getParameter("board'"+i+"'");
			year[i]=request.getParameter("year'"+i+"'");
			
		}
		//Project Details
		String project_n=request.getParameter("project_no");
		int project_no=Integer.parseInt(project_n);
		String[] project=new String[project_no];
		String project_str=Arrays.toString(project);
		String[] language=new String[project_no];
		//String[] language=new String[project_no];
		
//		for(int i=0;i<project_no;i++) {
//			project_str[i]=request.getParameter("project'"+i+"'");
//			language[i]=request.getParameter("language'"+i+"'");
//			System.out.println(project[i]);
//		}
		//Technologies details
		String techologies_n=request.getParameter("techologies_no");
		int techologies_no=Integer.parseInt(techologies_n);
		String[] technologies=new String[techologies_no];

		for(int i=0;i<project_no;i++) {
			technologies[i]=request.getParameter("tech'"+i+"'");
			System.out.println(technologies[i]);
		}
		//Experience Details
		System.out.println(name+" "+email+" "+DOB+" "+age+" "+phone+" "+LinkedIn+" "+Address+" "+About);
		System.out.println(courses);
		System.out.println(percentage);
		System.out.println(board);
		System.out.println(year);
		System.out.println(project);
		System.out.println(language);
		System.out.println(technologies);
	}
}
