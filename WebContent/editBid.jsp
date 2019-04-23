<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

Enter the information you want to update: if not updating then enter old information:

	<form method="post" action="editBidHandler.jsp">
		<table>
					<tr>
				<td>Enter the username for the person who's bid you want to update</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>Enter the auction ID for the auction who's bid you want to update </td>
				<td><input type="text" name="auction_id"></td>
			</tr>
			<tr>
				<td>Bid Amount</td>
				<td><input type="text" name="bid_amount"></td>
			</tr>
			<tr>
				<td>Max Amount</td>
				<td><input type="text" name="max_amount"></td>
			</tr>

			<tr>
				<td>Increment Amount</td>
				<td><input type="text" name="incr_amount"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>

</body>
</html>