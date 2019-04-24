<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post a Question</title>
</head>
<body>
Post your question here, limit of 200 characters.
	<form method="post" action="submitQuestion.jsp">
		<table>
			<tr>
				<td>Question</td>
				<td><input type="text" name="body"></td>
				<td></td>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>

</body>
</html>