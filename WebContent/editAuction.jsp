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

	<form method="post" action="editAuctionHandler.jsp">
		<table>

			<tr>
				<td>Enter the auction ID for the auction you want to update </td>
				<td><input type="text" name="auction_id"></td>
			</tr>
			<tr>
				<td>Min Price</td>
				<td><input type="text" name="minPrice"></td>
			</tr>
			<tr>
				<td>Initial Price</td>
				<td><input type="text" name="iPrice"></td>
			</tr>

			<tr>
				<td>Increment Bid</td>
				<td><input type="text" name="iBid"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>

</body>
</html>