<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>

<% 	
	Connection conn = null;
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=myDB; encrypt = false ";
	
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"sa", "1234");
		
		out.println("MSSQL 서버에 <b> 성공적으로 </b> 접속했습니다 <br>");
		
		
	}catch (Exception e){
		out.println ("MSSQL 서버에 <b> 접속 실패 </b> 했습니다 <br>");
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