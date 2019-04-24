<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

    	<div class="content">
    		<h1>Hello <%=session.getAttribute("user")%>. Here are your alerts:</h1>
    		<%
	    		String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
	    		Connection conn = null;
	    		
	    		try {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
					String alertQuery = "SELECT * FROM cd336db.alert WHERE *";
					String us=session.getAttribute("user").toString();
					Statement myStmt = conn.createStatement();
					PreparedStatement alerts = conn.prepareStatement(alertQuery);
					ResultSet alertRs = myStmt.executeQuery("select * from cs336db.alert a where a.alertid in( select b.alertid from cs336db.makes b where username='"+us+"')");
					//out.print("<p> WORKING UNTIL HERE</p>");

					ResultSetMetaData rsmd = alertRs.getMetaData();
					int cols=rsmd.getColumnCount();
					while(alertRs.next()) {
						for(int i=1;i<=cols;i++){
							if(i==2) out.print("\t\t\t\t   Content: ");
							if(i==3) {
								%>
								<br>
								<%
								out.print("               For Item ID:   ");
							}
							String colVal= alertRs.getString(i);
							if (i==1) {
								out.print("Alert ID: ");
							};
							out.print(colVal/*+ rsmd.getColumnName(i)*/);
							if(i==1) %> <br> <%
						}
						%>
						<br>
						<br>
						<%

					}
					%>
					<br>
					<h4> Have another item that you interested in? Enter the item's ID below to set up an alert for it!</h4>
					<br>
					<form method="post" action="createAlert.jsp">
						<table>
							<tr>
								<td>Item ID</td>
								<td><input type="text" name="item_ID"></td>
								<td></td>
								<td><input type="submit" value="submit"></td>
							</tr>
						</table>
					</form>
					
										<br>
					<h4> Want to delete an alert? Enter the alert's ID below to stop seeing it!</h4>
					<br>
					<form method="post" action="deleteAlert.jsp">
						<table>
							<tr>
								<td>Item ID</td>
								<td><input type="text" name="alertid"></td>
								<td></td>
								<td><input type="submit" value="submit"></td>
							</tr>
						</table>
					</form>
					<%
					

    		} catch (SQLException e) {
				out.print("<p>Error connecting to MYSQL server.</p>");
			    e.printStackTrace();
			} finally {
				System.out.println("\n\nAlert managed\n\n");
				try { conn.close(); } catch (Exception e) {}			
			}	
			%>
    	</div>
</body>
</html>