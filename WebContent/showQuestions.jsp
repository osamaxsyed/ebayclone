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
    		<h1>Hello <%=session.getAttribute("user")%>!</h1>
    		<h4> Here are the results to your search!</h4>
    		<%
	    		String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
	    		Connection conn = null;
	    		String keyword = request.getParameter("keyword");
	    		try {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
					String alertQuery = "SELECT * FROM cd336db.asks WHERE *";
					Statement myStmt = conn.createStatement();
					PreparedStatement alerts = conn.prepareStatement(alertQuery);
					ResultSet alertRs = myStmt.executeQuery("select * from cs336db.asks where body like '%"+keyword+"%'");
					ResultSetMetaData rsmd = alertRs.getMetaData();
					int cols=rsmd.getColumnCount();
					while(alertRs.next()) {
						for(int i=1;i<=cols;i++){
							String colVal= alertRs.getString(i);
							out.print(colVal/*+ rsmd.getColumnName(i)*/);
							if(i==1) out.println(" asks:\n");
							if(i==2) {
								%>
								<br>
								<%
								out.print("\n Answer from our representative:");
								%>
								<br>
								<%
							}
						}
						%>
						<br>
						<%
					}
					
					//out.print("<p> WORKING UNTIL HERE</p>");

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