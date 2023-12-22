<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>  

<%
	Connection conn = null;		// Connection 객체 변수 
	String driver = "oracle.jdbc.driver.OracleDriver";		// ojdbc11.jar
	String url = "jdbc:oracle:thin:@localhost:1521:XE";		// Oracle JDBC

	// 예외 설정
	try{		// try 블록에서 오류가 있을때 catch가 작동
		
		Class.forName(driver); // driver 로드
		conn = DriverManager.getConnection(url, "C##HR", "1234");
		
		// JSP에서 출력	
		out.println("DB 연결이 성공했습니다");
	
	}catch (Exception e){
		 
		out.println("DB 연결이 실패했습니다");
		
		// DB 연결 실패시 오류 정보를 콘솔에 출력
		e.printStackTrace();

	}
	out.println("<br><br>");
	out.println("프로그램이 정상 작동");

	
	
	
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