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

	<form method="post" action="answerQuestionHandler.jsp">
		<table>
					<tr>
				<td>Enter the Question ID for the question you'd like to answer</td>
				<td><input type="text" name="question"></td>
			</tr>
			<tr>
				<td>What is your answer</td>
				<td><input type="text" name="answer"></td>
			</tr>
	
		</table>
	</form>

</body>
</html>