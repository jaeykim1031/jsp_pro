<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*, java.util.*"  %>
<%@ include file = "../db_conn/db_conn_oracle.jsp"%>

<%
	// DB에서 가져온 레코드셋을 rs에 담고 ArrayList에 저장 후 출력
	
	ArrayList<String> name = new ArrayList<>();
	ArrayList<String> email = new ArrayList<>();
	ArrayList<String> subject = new ArrayList<>();
	ArrayList<String> content = new ArrayList<>();
	
	// 객체 변수 선언
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	sql = "select * from guestboard order by name desc";
	
	//pstmt 활성화
	pstmt = conn.prepareStatement(sql);
	
	try{
		//pstmt의 쿼리 실행 
		rs = pstmt.executeQuery();
	
	}catch (Exception e){
		out.println( "DB에 값을 읽어오는 동안 오류 발생" );
		e.printStackTrace();
	}
	
	// rs에 저장된 값을 ArrayList에 저장
	if(rs.next()){
		do{
			name.add(rs.getString("name")); 		// DB의 이름 레코드만 저장
			email.add(rs.getString("email"));
			subject.add(rs.getString("subject"));
			content.add(rs.getString("content"));
			
			
		}while(rs.next());
	}
	

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<h2> RS에 저장된 값을 ArrayList에 저장 후 출력 </h2>
		
		<table width = "600px" border = "1px">
		
		<tr> <th> 이름 </th>  <th> 이메일 </th> <th> 제목 </th> <th> 내용 </th> </tr>
		
		
		<%	
			for ( int i = 0 ; i < name.size() ; i++){
				
			
		%>
		
		<tr> <td> <%= name.get(i) %> </td> 
			 <td> <%= email.get(i) %> </td> 
			 <td> <%= subject.get(i) %> </td> 
			 <td> <%= content.get(i) %> </td>   
		</tr>
		
		
		<%
			}
		%>
		
		</table>

</body>
</html>