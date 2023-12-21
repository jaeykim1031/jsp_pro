<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import = "java.sql.*"  %>
<%@ include file = "../db_conn/db_conn_oracle.jsp"%>
    
<%
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	sql = "select * from guestboard order by name desc ";
	
	pstmt = conn.prepareStatement(sql);
	
	try {
		// pstmt 객체 실행 후 rs에 저장 
		// rs : select 한 모든 레코드 저장
		rs = pstmt.executeQuery() ;
		
	}catch (Exception e){
		out.println("DB에서 select 중 오류 발생. ");
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

		<h2> PreParedStatement 쿼리 실행 후 rs에 담아서 출력 </h2>
		
		<table width = "600px" border = "1">
			<tr> <th> 이름 </th>  <th> 이메일 </th> <th> 제목 </th> <th> 내용 </th> </tr>
		
		<%
			if( rs. next()){
				do {
	
		%>
		
		<!--  출력 부분 : 테이블의 index 로 출력 -->
		<tr> <td> <%= rs.getString(1) %> </td> 
			 <td> <%= rs.getString(2) %> </td> 
			 <td> <%= rs.getString(3) %> </td> 
			 <td> <%= rs.getString(4) %> </td>   
		</tr>
		

		<%
		
				}while (rs.next());
				
			}else {
				out.println ("DB에 값이 존재하지 않는다");
			}
		
		
		%>













		</table>

</body>
</html>