<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% 

String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
PreparedStatement ps = null;

try {
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
	
	
	String auction_id = request.getParameter("auction_id");
	String username = request.getParameter("username");

	System.out.println(auction_id);
	Statement myStmt;
	myStmt = conn.createStatement();
	int myRs = myStmt.executeUpdate("delete from cs336db.bid where auction_id = '"+ auction_id +"' AND username = '" + username+"'");
	System.out.println("rows deleted: " + myRs);
	response.sendRedirect("sucessforPostedBid.jsp"); 

	


	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}












%>