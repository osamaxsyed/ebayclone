<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<body>
<h2 align="left"><font><strong>Showing Items Categorized by Item ID </strong></font></h2>
<table align="left" cellpadding="5" cellspacing="4" border="0.5">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>itemID</b></td>
<td><b>AuctionID</b></td>
<td><b>type</b></td>
<td><b>distributor</b></td>
<td><b>model</b></td>
<td><b>color</b></td>
<td><b>Winner</b></td>
<td><b>StartTime</b></td>
<td><b>EndTime</b></td>
<td><b>MinPrice</b></td>
<td><b>InitPrice</b></td>
</tr>
</body>

<% 

String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
PreparedStatement ps = null;

try {
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
	
	
	String Item_ID = request.getParameter("Item_ID");
	Statement myStmt;
	myStmt = conn.createStatement();

	
	ResultSet myRs = myStmt.executeQuery("select * from cs336db.has h,cs336db.item i,cs336db.Auction a where h.item_ID = i.item_ID AND h.auction_id = a.auction_id AND i.Item_ID = '"+ Item_ID +"';");

	
	
	
	while(myRs.next()){
		%>
		<tr bgcolor="#DEB887">
		<td><%=myRs.getString("item_ID") %></td>
		<td><%=myRs.getString("auction_id") %></td>
		<td><%=myRs.getString("item_type") %></td>
		<td><%=myRs.getString("distributor") %></td>
		<td><%=myRs.getString("item_model") %></td>
		<td><%=myRs.getString("item_color") %></td>
		<td><%=myRs.getString("winner") %></td>
		<td><%=myRs.getString("start_time") %></td>
		<td><%=myRs.getString("end_time") %></td>
		<td><%=myRs.getString("min_price") %></td>
		<td><%=myRs.getString("initial_price") %></td>		
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
	
	<form method=post action="search.jsp">
		<input type="submit" value="Back to Browse" />
	</form>	

