<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<body>
<h2 align="left"><font><strong>Showing all Bids of this Auction </strong></font></h2>
<table align="left" cellpadding="5" cellspacing="4" border="0.5">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>Auction ID</b></td>
<td><b>Username</b></td>
<td><b>Bid Amount</b></td>
<td><b>Max Amount</b></td>
<td><b>Increment Amount</b></td>

</body>

<% 

String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
PreparedStatement ps = null;

try {
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
	
	
	String auction_id = request.getParameter("auction_id");
	Statement myStmt;
	myStmt = conn.createStatement();

	
	ResultSet myRs = myStmt.executeQuery("select * from cs336db.bid b WHERE b.auction_id = '"+ auction_id +"';");

	
	
	
	while(myRs.next()){
		%>
		<tr bgcolor="#DEB887">
		<td><%=myRs.getString("auction_id") %></td>	
		<td><%=myRs.getString("username") %></td>	
		<td><%=myRs.getString("bid_amount") %></td>	
		<td><%=myRs.getString("max_amount") %></td>	
		<td><%=myRs.getString("incr_amount") %></td>	
		</tr>
		<% 
	}
	
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>

	<form method=post action="logout.jsp">
		<input type="submit" value="Logout" />
	</form>
	
	<form method=post action="index.jsp">
		<input type="submit" value="Back to Main Menu" />
	</form>	

