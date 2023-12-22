<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSP에서 java.sql 패키지의 하위 모든 클래스를 import
			java.util 패키지의 하위 클래스 import  -->
<%@ page import = "java.sql.*, java.util.*" %>

<!-- 클라이언트에서 넘어오는 한글이 깨지지 않게 -->
<% request.setCharacterEncoding("UTF-8");  %>

<!-- 클라이언트에서 넘어오는 값을 받아서 출력 -->
<% 
	// 자바 부분
	//  parameter : ?변수 = 값&변수=값&변수
	//  parameter 로 넘어오는 값은 모두 String
		
	String na = request.getParameter("name"); 
	String em = request.getParameter("email"); 
	String sub = request.getParameter("subject"); 
	String cont = request.getParameter("contents"); 
	
%>

<!--  DB Connection 객체를 import -->
<%@ include file = "../db_conn/db_conn_oracle.jsp" %> 

<!-- Statement 객체를 사용해서 DB에 저장 -->

<%
	//client에서 받은 값을 DB에 저장
	String sql = null;
	PreparedStatement pstmt = null;
	
	sql = "insert into guestboard (name, email, subject, content)";
	sql = sql + "values (?,?,?,?)";
	

	// ***PreparedStatement*** 객체 활성화 : Connection 객체로 PreparedStatement 객체 생성
	pstmt = conn.prepareStatement(sql);
	
	// pstmt : ?에 변수 값 할당 후 실행
	pstmt.setString(1,na);		
	pstmt.setString(2,em);		
	pstmt.setString(3,sub);		
	pstmt.setString(4,cont);		
	
	
	//stmt로 DB에 값을 insert
	try{
		pstmt.executeUpdate();		// DB에 저장 완료
		
	}catch(Exception e){
		
		e.printStackTrace();
		out.println("DB 저장에 실패");
	}


%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<p><p><p>
	<!--  변수에 담긴 값을 출력 -->
	<h2> 변수로 넘어온 값 출력 </h2>
	<%= na %>
	<br>
	<%= em %>
	<br>
	<%= sub %>
	<br>
	<%= cont %>


</body>
</html>













