<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");

		} else {
			String reportType = request.getParameter("type");

			String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;

			try {

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
				String query = null;

				if (reportType.equals("totalEarnings")) {
					query = "SELECT SUM(min_price) FROM cs336db.item, cs336db.Auction WHERE item_ID=auction_id and winner IS NOT NULL";
					ps = conn.prepareStatement(query);
					rs = ps.executeQuery();

					if (rs.next()) {
	%>
	<h2>Sales Report:</h2>
	<table>
		<tr>
			<th>Total Earnings</th>
		</tr>

		<%
			do {
		%>

		<tr>
			<td><%=
					rs.getDouble("SUM(min_price)")
				%></td>
		</tr>


		<%
			} while (rs.next());

						}

					}	else if (reportType.equals("earningsPerItem")) {
						query = "SELECT item_model, SUM(min_price) FROM cs336db.item, cs336db.Auction WHERE item_ID=auction_id and winner IS NOT NULL group by item_model";
						ps = conn.prepareStatement(query);
						rs = ps.executeQuery();

						if (rs.next()) {
		%>
		<h2>Sales Report:</h2>
		<table>
			<tr>
				<th>Model</th>
				<th>Earnings</th>
			</tr>

			<%
				do {
			%>

			<tr>
				<td><%=rs.getString("item_model") %></td>
				<td><%=rs.getDouble("SUM(min_price)")%></td>
			</tr>


			<%
				} while (rs.next());

							}

						}else if (reportType.equals("earningsPerItemType")) {
							query = "SELECT item_type, SUM(min_price) FROM cs336db.item, cs336db.Auction WHERE item_ID=auction_id and winner IS NOT NULL group by item_type";
							ps = conn.prepareStatement(query);
							rs = ps.executeQuery();

							if (rs.next()) {
			%>
			<h2>Sales Report:</h2>
			<table>
				<tr>
					<th>Model</th>
					<th>Category</th>
				</tr>

				<%
					do {
				%>

				<tr>
					<td><%=rs.getString("item_type") %></td>
					<td><%=rs.getDouble("SUM(min_price)")%></td>
				</tr>


				<%
					} while (rs.next());

								}

							}else if (reportType.equals("earningsPerEndUser")) {
								query = "SELECT winner, SUM(min_price) FROM cs336db.item, cs336db.Auction WHERE item_ID=auction_id and winner IS NOT NULL group by winner";
								ps = conn.prepareStatement(query);
								rs = ps.executeQuery();

								if (rs.next()) {
				%>
				<h2>Sales Report:</h2>
				<table>
					<tr>
						<th>Model</th>
						<th>Winner</th>
					</tr>

					<%
						do {
					%>

					<tr>
						<td><%=rs.getString("winner") %></td>
						<td><%=rs.getDouble("SUM(min_price)")%></td>
					</tr>


					<%
						} while (rs.next());

									}

								}else if (reportType.equals("bestSelling")) {
									query = "SELECT item_model,count(item_model), SUM(min_price) FROM cs336db.item, cs336db.Auction WHERE item_ID=auction_id and winner IS NOT NULL group by item_model order by count(item_model) desc";
									ps = conn.prepareStatement(query);
									rs = ps.executeQuery();

									if (rs.next()) {
					%>
					<h2>Sales Report:</h2>
					<table>
						<tr>
							<th>Model</th>
							<th>Number Sold</th>
							<th>Earnings</th>
						</tr>

						<%
							do {
						%>

						<tr>
							<td><%=rs.getString("item_model") %></td>
							<td><%=rs.getInt("count(item_model)") %></td>
							
							<td><%=rs.getDouble("SUM(min_price)")%></td>
						</tr>


						<%
							} while (rs.next());

										}

									}else if (reportType.equals("bestBuyers")) {
										query = "SELECT winner, count(winner), sum(min_price) FROM cs336db.item, cs336db.Auction WHERE item_ID=auction_id and winner IS NOT NULL group by winner order by count(winner) desc";
										ps = conn.prepareStatement(query);
										rs = ps.executeQuery();

										if (rs.next()) {
						%>
						<h2>Sales Report:</h2>
						<table>
							<tr>
								<th>Buyer</th>
								<th>Items Bought</th>
								<th>Money Spend</th>
							</tr>

							<%
								do {
							%>

							<tr>
								<td><%=rs.getString("winner") %></td>
								<td><%=rs.getInt("count(winner)") %></td>
								<td><%=rs.getDouble("SUM(min_price)")%></td>
							</tr>


							<%
								} while (rs.next());

											}

										}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		%>
		
</body>
</html>