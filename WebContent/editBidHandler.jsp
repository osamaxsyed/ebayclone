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
	String auction_id = request.getParameter("auction_id");
	String uname = request.getParameter("uname");
	String bidAmount = request.getParameter("bid_amount");
	String maxAmount = request.getParameter("max_amount");
	String incrAmount = request.getParameter("incr_amount");



	Statement myStmt;
	myStmt = conn.createStatement();
	String sql = 
			"update cs336db.bid SET bid_amount =" 
			+ "'"+bidAmount+"',"
			+ "max_amount="
			+ "'"+ maxAmount +"'"+ "," 
			+ "incr_amount ="
			+ "'"+ incrAmount+"'" 
			+ "WHERE username = "
			+ "'"+ uname+"' AND auction_id = "
			+"'" +auction_id+"'"
			
			;
	
	
	
	
	myStmt.executeUpdate(sql);
	response.sendRedirect("sucessforPostedBid.jsp");

	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>