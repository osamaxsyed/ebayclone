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

	<form method="post" action="editAccountHandler.jsp">
		<table>
					<tr>
				<td>Enter the username for the account you want to update</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>First name</td>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<td>Last name</td>
				<td><input type="text" name="lname"></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="text" name="email"></td>
			</tr>

			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>

</body>
</html>