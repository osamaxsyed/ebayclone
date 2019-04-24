<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.text.SimpleDateFormat" %>
<%@page import ="java.text.DateFormat" %>
<%@page import ="java.util.Date" %>

<% 
String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
PreparedStatement ps = null;


try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
	
	//get information from text 
			String body = request.getParameter("body");
			
			
			Statement myStmt;
			myStmt = conn.createStatement();

			
			//get count of items
			Statement sta;
			sta = conn.createStatement();
	           Random randomNum=new Random();
	           int count = 1+ randomNum.nextInt(100000000);
           // fill in data for item
           String sql = "insert into cs336db.question (question_ID, body) values("+count+",'"+body+"')";
           //System.out.print(sql);
			myStmt.executeUpdate(sql);
			
			String us= session.getAttribute("user").toString();

			
			Statement second;
			second = conn.createStatement();
            
            String intoA = "insert into cs336db.asks (username, body, question_ID) values('"+us+"', '"+body+"',"+count+")";
            second.executeUpdate(intoA);
            
            //change post table 

			response.sendRedirect("Questions.jsp"); 
			
		}catch (SQLException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("Questions.jsp");
		}
%>