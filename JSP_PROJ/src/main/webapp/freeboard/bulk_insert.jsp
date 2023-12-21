<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>    
<%@ include file = "./conn_oracle.jsp" %>

<%
	// for를 통해 freeboard 테이블에 값 1000개 insert
	String sql = null;
	PreparedStatement pstmt = null;

	int id = 0 ;
	int masterID =0;
	
	sql = "insert into freeboard (id, name, password, email, "; 
	sql += "subject,content, inputdate, masterid,readcount,replaynum,step ) " ;		
	sql += "values ( ?,?,?,?,?,?,?,?," ;
	sql +=  "0 , 0 , 0)";
	
	pstmt = conn.prepareStatement(sql);
	// pstmt 객체의 sql 쿼리 
	for (int i =0 ; i<1000 ; ++i){
		pstmt.setInt(1, id += 1	 );
		pstmt.setString(2,"hong" + i);
		pstmt.setString(3, "1244");
		pstmt.setString(4, "ae@df.com	-" + i );
		pstmt.setString(5,	"제목 - "+ i );
		pstmt.setString(6,	"날짜 - " + i );
		pstmt.setString(7, "23-12-21" );
		pstmt.setInt(8, masterID += 1	 );

		
		pstmt.executeUpdate();
	}
	out.println(" 1000개의 값 잘 저장 됨 ");

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