package com.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contactusform")
public class Register extends HttpServlet {
	
	public void service(HttpServletRequest req , HttpServletResponse res) {
		PrintWriter out = null;
		try {
			out = res.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String name = req.getParameter("full-name") ; 
		String email = req.getParameter("email") ;
		String message =  req.getParameter("message") ;
		
		final String DATABASE_URL = "jdbc:postgresql://localhost:5432/contactInfo";
	    final String DATABASE_USERNAME = "postgres";
	    final String DATABASE_PASSWORD = "abcd";
		
	    
	    try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
		
		try(Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);){
			PreparedStatement ps = connection.prepareStatement("insert into info(name,email,message) values(?,?,?)") ;
			
			ps.setString(1, name) ;
			ps.setString(2, email) ;
			ps.setString(3, message) ;
			
			int count = ps.executeUpdate();	
			
			if(count > 0 ) {
				res.setContentType("text/html") ;
				out.println("<h3 style='color:green'> Message Added </h3>");
				RequestDispatcher rd = req.getRequestDispatcher("/contact_us.jsp") ;
				rd.include(req, res);
			}else {
				res.setContentType("text/html") ;
				out.println("<h3 style='color:red'> Message Not Added </h3>") ;
				RequestDispatcher rd = req.getRequestDispatcher("/contact_us.jsp") ;
				rd.include(req, res);
			}
		}catch (Exception e) {
			res.setContentType("text/html") ;
			out.println("<h3 style='color:red'> " + e.getMessage() + "</h3>") ;
			RequestDispatcher rd = req.getRequestDispatcher("/contact_us.jsp") ;
			try {
				rd.include(req, res);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
	}

}
