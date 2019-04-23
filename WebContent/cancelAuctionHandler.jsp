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
	
	
	String item_ID = request.getParameter("item_ID");
	String seller = request.getParameter("seller");
	System.out.println(item_ID + " " + seller);
	Statement myStmt;
	myStmt = conn.createStatement();
	String actualPassword = null;
	int security =0;
	int myRs = myStmt.executeUpdate("delete from cs336db.item where item_ID = '"+ item_ID +"';");
	


	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}












%>