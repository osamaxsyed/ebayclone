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
			String item = request.getParameter("alertid");
			
			Integer alert = Integer.parseInt(item);
			
			
			Statement myStmt;
			myStmt = conn.createStatement();

			
			//get count of items
			Statement sta;
			sta = conn.createStatement();
           String sql = "delete from cs336db.makes where alertid="+alert;
			myStmt.executeUpdate(sql);

			
			Statement second;
			second = conn.createStatement();

            String intoM = "delete from cs336db.alert where alertid="+alert;
            second.executeUpdate(intoM);
            
			response.sendRedirect("Alerts.jsp"); 
			
		}catch (SQLException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
%>