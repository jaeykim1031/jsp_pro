<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import ="java.sql.*" %>
 
 <%@ include file = " ../db_conn/db_conn_mssql.jsp" %>

 <%
 	String sql = null;
 	Statement stmt = null;
 	
 	ResultSet rs = null;
 
 	//쿼리 작성  
 		sql = "select * from guestboard"; 
 		
 		//Statement 객체 생성 
 		stmt = conn.createStatement() ; 	// stmt 는 Oracle의 XE DB 연결 한 상태에서 
 		
 		
 		try {
 			//stmt 객체에 sql 쿼리를 넣어서 실행 : 
 				
 		 rs =  stmt.executeQuery(sql); 		// sql : select 문인 경우 , select 한 결과 레코드셋을 담은 객체 : rs 
 			//rs는 select 한 결과 레코드셋 을 담고 있다. 
 			// rs.next()   : 다음 레코드가 존재하면 true 
 			
 		}catch (Exception e) {
 			out.println("DB 접속에 문제가 생겼습니다. "); 
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
 		<center>
 		<h2> DB의 값을 읽어와서 출력 하는 페이지 </h2>
 		
 		<%
 			if (rs.next()) {	//rs의 레코드가 존재할때 작동됨 , 커서가 다음 레코드로 위치함. 
 				do {
 		%>
 			<table border="1" width="600px">
 				<tr><td colspan = "2"> <%= rs.getString("subject") %></td> </tr>
 				<tr><td>글쓴이 : </td><td><%= rs.getString("name") %></td> </tr>
 				<tr><td>이메일 : </td><td><%= rs.getString("email") %></td> </tr>
 				<tr><td>글내용 : </td><td><%= rs.getString("content") %></td> </tr>
 			</table>	
 			<br> 
 		<%
 				}while ( rs.next() ); 
 			}
 		%>
 		
 		</center>
 	</body>
 	</html>