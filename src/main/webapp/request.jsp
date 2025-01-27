<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    Boolean isAdminLoggedIn = (Boolean) session.getAttribute("isAdminLoggedIn");

    if (isAdminLoggedIn == null || !isAdminLoggedIn) {
    	response.setContentType("text/html") ;
    	out.println("Admin should be logged in to see data") ;
    	RequestDispatcher rd = request.getRequestDispatcher("/login.jsp") ;
        rd.include(request,response) ;
        return;
    }
%>

    
   <% 
   
   
   String DATABASE_URL = "jdbc:postgresql://localhost:5432/contactInfo";
   String DATABASE_USERNAME = "postgres";
   String DATABASE_PASSWORD = "abcd";
   
   try {
		Class.forName("org.postgresql.Driver");
	} catch (ClassNotFoundException e) {
	    e.printStackTrace();
	}

	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet resultSet = null;

	
   
   %>
<!DOCTYPE html><html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Data Display</title>
 
    <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      flex-direction: column;
    }

    h2 {
      font-size: 24px;
      text-align: center;
      color: #333;
    }

    .table-container {
      display: flex;
      gap: 20px;
      margin-top: 20px;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      max-width: 400px;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    th, td {
      padding: 10px;
      text-align: left;
      border: 1px solid #ccc;
    }

    th {
      background-color: #f2f2f2;
      font-weight: bold;
    }

    tbody tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .table-title {
      font-size: 18px;
      text-align: center;
      margin-bottom: 10px;
      font-weight: bold;
      color: #333;
    }
  </style>
</head>
<body>
  <h2>Database Information</h2>
   <div style="position: absolute; top: 20px; right: 20px;">
    <form action="logout" method="post" style="display: inline;">
      <button 
        style="
          background-color: #ff4d4d; 
          color: white; 
          border: none; 
          padding: 10px 15px; 
          font-size: 14px; 
          border-radius: 5px; 
          cursor: pointer; 
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        " 
        type="submit">
        Logout
      </button>
    </form>
  </div>
   
  <div class="table-container">
    <div>
      <div class="table-title">Active Users</div>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
          </tr>
        </thead>
        <tbody>
           <%
           
        try {
        	connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
            ps = connection.prepareStatement("select id, name,email,message from info where isactive=true") ;
            resultSet = ps.executeQuery();
            while (resultSet.next()) {
        %>
                <tr>
                    <td><%=resultSet.getString("id") %></td>
                    <td><%=resultSet.getString("name") %></td>
                    <td><%=resultSet.getString("email") %></td>
                    <td><%=resultSet.getString("message") %></td>
                    <td>
	                    <form action = "archive" method="post">
	                    	<input type = "hidden" name = "id" value="<%=resultSet.getString("id")%>" >
	                    	<input type = "hidden" name = "button" value="archieve" >
	                    	
	                    	<button class="button-archive">Archive</button>
	                    </form>
                   </td>
                </tr>
        <%
           
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
        	ps.close() ;
        	connection.close() ;
        }
        %>
        </tbody>
      </table>
    </div>

    <div>
      <div class="table-title">Inactive Users</div>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
          </tr>
        </thead>
                <tbody>
           <%
        try {
        	connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
            ps = connection.prepareStatement("select id, name,email,message from info where isactive=false") ;
            resultSet = ps.executeQuery();
            while (resultSet.next()) {
        %>
                <tr>
                    <td><%=resultSet.getString("id") %></td>
                    <td><%=resultSet.getString("name") %></td>
                    <td><%=resultSet.getString("email") %></td>
                    <td><%=resultSet.getString("message") %></td>
                    <td>
	                    <form action = "archive" method="post">
	                    	<input type = "hidden" name = "id" value="<%=resultSet.getString("id")%>" >
	                    	<input type = "hidden" name = "button" value="active" >
	                    	
	                    	<button class="button-archive">Active</button>
	                    </form>
                   </td>
                </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
        	ps.close() ;
        	connection.close() ;
        }
        %>

        
        </tbody>

      </table>
    </div>
  </div>
</body>
</html>


