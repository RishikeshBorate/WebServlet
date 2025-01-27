package com.org;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginForm")
public class AdminLoginServlet extends HttpServlet{
	
	public void service(HttpServletRequest request , HttpServletResponse response ) {
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String email = request.getParameter("email") ;
		String password = request.getParameter("password") ;
		
		try {
			
			if(email.equals("admin@123") && password.equals("admin")) {
				response.setContentType("text/html") ;
				out.println("Login Success");
				
				HttpSession session = request.getSession() ;
				session.setAttribute("isAdminLoggedIn", true) ;
				
				RequestDispatcher rd = request.getRequestDispatcher("/request.jsp") ;
				rd.include(request, response);
			
				
			}else {
				response.setContentType("text/html") ;
				out.println("Wrong credintials") ;
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp") ;
				rd.include(request, response);
				
			}
			
		}catch (Exception e) {
			
		}
	}

}
