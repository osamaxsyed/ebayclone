<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <% if (session.getAttribute("user") == null) { 
    	response.sendRedirect("login.jsp");

    		
    } else{ %>
    
    	    <form action="cancelBidHandler.jsp" method="POST">
            	<input type="text" name="auction_id" placeholder="auction_id" required><br>
             	<input type="text" name="username" placeholder="username" required><br>    			
            	    			
    			<input type="submit" value="Cancel The Bid">
    		</form>
    
    
    <% }%>

</body>
</html>