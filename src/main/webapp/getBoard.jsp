<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ page import="board.BoardDTO" %>
    
    <%
    	// session 변수에 담긴 값을 불러옴 : 서버의 RAM
    	BoardDTO board = new BoardDTO();
    
    	board = (BoardDTO) session.getAttribute("board");		// 다운 캐스팅
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 글 상세 페이지 </title>
</head>
<body>
	<center>
	<h1> 글 상세 페이지 (수정 가능) </h1>
	<hr>
	<br> <br>
	<form>
		<table border="1" width ="700px" cellpadding = "5px" >
			<tr> <td bgcolor="blue" align="center" > 제목 </td> 
				 <td> <input type="text" name="title" value="<%= board.getTitle() %>"> </td> 	
			</tr>
			
			<tr> <td bgcolor="blue" > 작성자 </td> 
				 <td> <input type="text" name="write" value="<%= board.getWrite() %>">  </td> 	
			</tr>
			
			<tr> <td bgcolor="blue" > 내용 </td> 
				 <td> <textarea rows="10" cols="70"value= "<%= board.getContent() %>"></textarea> </td> 	
			</tr>
			
			<tr> <td bgcolor="blue" > 등록일 </td> 
				 <td> <%= board.getRegdate() %>  </td> 	
			</tr>
			
			<tr> <td bgcolor="blue" > 조회수  </td> 
				 <td> <%= board.getCnt() %>   </td> 	
			</tr>
			
			<tr> <td colspan="2" align="center" > <input type="text"t" value="글 수정"> </td> 
				 <td>  </td> 	
			</tr>
			
		
		
		
		</table>
	</form>
	</center>

</body>
</html>