<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<form method="post" action="showQuestions.jsp">

<table align="left" cellpadding="5" cellspacing="5" border="1">



			<tr>
				<td>Search already asked questions... Please enter one keyword to search for</td>
				<td><input type="text" name="keyword"></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" value="Search"></td>
			</tr>
			
</table>
</form>

</body>
</html>