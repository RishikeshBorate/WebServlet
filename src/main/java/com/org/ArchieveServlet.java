package com.org;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/archive")
public class ArchieveServlet extends HttpServlet{
       public void service(HttpServletRequest request , HttpServletResponse response) {
    	   final String DATABASE_URL = "jdbc:postgresql://localhost:5432/contactInfo";
   	       final String DATABASE_USERNAME = "postgres";
   	       final String DATABASE_PASSWORD = "abcd";
   	       
   		String id = request.getParameter("id") ;
   		String action = request.getParameter("button") ;
   		
   	     try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
   		
   		try(Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD)) {
   			
   			if(action.equals("archieve")) {
   				PreparedStatement ps = connection.prepareStatement("update info set isactive=false where id =? ") ;
  
   	   			ps.setInt(1, Integer.parseInt(id));
   	   			
   	   		    ps.executeUpdate(); 
   	   		    
   				response.setContentType("text/html") ;
   	   		    RequestDispatcher rd = request.getRequestDispatcher("/request.jsp") ;
   				rd.include(request, response);   	
   				
   				ps.close();
   			}
   			
   			if(action.equals("active")) {
   				PreparedStatement ps = connection.prepareStatement("update info set isactive=true where id =? ") ;
   	   			
   	   			ps.setInt(1, Integer.parseInt(id));
   	   			
   	   		    ps.executeUpdate(); 
   	   		    
   				response.setContentType("text/html") ;
   	   		    RequestDispatcher rd = request.getRequestDispatcher("/request.jsp") ;
   				rd.include(request, response);   	
   				
   				ps.close();
   			}
		}catch (Exception e) {
   			System.out.println(e.getMessage()) ;
   		}
       }
}
