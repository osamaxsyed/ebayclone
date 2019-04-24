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
			String item = request.getParameter("item_ID");
			
			Integer itemiD = Integer.parseInt(item);
			
			
			Statement myStmt;
			myStmt = conn.createStatement();

			
			//get count of items
			Statement sta;
			sta = conn.createStatement();
			ResultSet result = sta.executeQuery("SELECT * from cs336db.alert");
            int k=0;
            while(result.next()) {
                k++;
            }
           int count = k+1;
           Random randomNum=new Random();
           count = 1+ randomNum.nextInt(100000000);
           // fill in data for item
           String sql = "insert into cs336db.alert"
					+ "(alertid, message, item_ID)"
					+ "values(" +"'"+count+ "'"+ ", 'the following item you requested is available', "+itemiD
					+ ")";
           System.out.print(sql);
			myStmt.executeUpdate(sql);

			
			Statement second;
			second = conn.createStatement();
			ResultSet test = sta.executeQuery("SELECT * from cs336db.Auction");
            int j=0;
            while(test.next()) {
                j++;
            }
            int total = j+1;
            String us= session.getAttribute("user").toString();
            String intoM = "insert into cs336db.makes"
					+ "(username, alertid)"
					+ "values(" +"'"+us+"', "+count
					+ ")";
            second.executeUpdate(intoM);
            
			response.sendRedirect("Alerts.jsp"); 
			
		}catch (SQLException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
%>