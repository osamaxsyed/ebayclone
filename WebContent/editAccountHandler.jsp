<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 

String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
PreparedStatement ps = null;


try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
	String uname = request.getParameter("uname");
	String password = request.getParameter("password");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("email");



	Statement myStmt;
	myStmt = conn.createStatement();
	String sql = 
			"update cs336db.enduser SET e_mail =" 
			+ "'"+email+"',"
			+ "password="
			+ "'"+ password+"'"+ "," 
			+ "first_name ="
			+ "'"+ fname+"'"+ "," 
			+ "last_name ="
			+ "'"+ lname+"'"  
			+ "WHERE username = "
			+ "'"+ uname+"'"  
			
			;
	
	
	
	
	myStmt.executeUpdate(sql);
	response.sendRedirect("sucessforPostedBid.jsp");

	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>