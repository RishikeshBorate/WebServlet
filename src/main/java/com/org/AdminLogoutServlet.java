package com.org;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class AdminLogoutServlet extends HttpServlet{
	
	public void service(HttpServletRequest request , HttpServletResponse response) {
		HttpSession session = request.getSession() ;
 		session.invalidate() ;
 		
 		response.setContentType("text/html");
 		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp") ;
 		
 		try {
			rd.include(request, response) ;
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
 		
	}

}
