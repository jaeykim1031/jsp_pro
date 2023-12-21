<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
    
<% 	
	Connection conn = null;
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mydb";
	
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url ,"root", "1234");
		
		out.println("성공적 접속 ");
		
		
	}catch (Exception e){
		out.println ("mySQL 서버에 <b> 접속 실패 </b> 했습니다 <br>");
		e.printStackTrace();
		
	} 
	
	




%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>