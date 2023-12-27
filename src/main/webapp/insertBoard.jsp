<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<center>
	
		<h1> 새 글 등록 - 회원 전용 </h1>
		<hr>
		
		<form method="post" action="insertBoard.do">
			<table border = "1" cellpadding = '10' cellspacing = "0" >
				<tr> <td bgcolor="orange" > 제목 </td> 
					<td> <input type = "text" name = "title"> </td> 
				</tr>
				<tr> <td bgcolor="orange" > 작성자 </td> 
					<td> <input type = "text" name = "write"> </td> 
				</tr>
				<tr> <td bgcolor="orange" > 내용 </td> 
					<td> <textarea name = "content" cols = "40" rows = "10"> </textarea> </td> 
				</tr>
				<tr> <td colspan="2" ailgn = "center"> 
							<input type = "submit" value = "새 글 등록">
					</td> 
				</tr>
				

			</table>
		
		</form>
	</center>



</body>
</html>