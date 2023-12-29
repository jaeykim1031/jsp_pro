<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, tr, td {
		padding : 10px;
	}

</style>

</head>
<body>

	<!--  form 태그 내부에서 사용되는 태그들 :  client == (get, post)== > server 
				- input : 
					type = "text" : 제목, 이름
					type = "password" : ****
					type = "radio" : 여러 값 중 하나만 선택 됨, 모든 변수명이 동일
					type = "checkbox" : 다중 선택, 각 변수명 정의
					type = "file" : 파일, 그림, 문서를 서버로 전송
					type = "button" : 자바스크립트 호출 후 submit 적용
					type = "reset" : form 태그의 모든 필드 값 초기화
					type = "submit" : form 태그의 action = "" 의 값 호출
					
				- select : 아래로 출력되는 내용 중 하나를 선택, name = "변수명"
					option : value = "값"
					
				- textarea : 대량의 글 작성에 사용 	
	-->


<center>
	<h2> 회원 가입 </h2>
	<hr color = "green">
	
	<form method = "post" action = "member2Insert.ac">
		<table width = "900px" border = "1px">
			<tr> <td align = "right" width = "200px"> 이름 : </td> 
				 <td> <input type = "text" name = "name" placeholder= "이름을 입력하시오" > </td> 
			</tr>
			
			<tr> <td align = "right"> 아이디 : </td> 
				 <td> <input type = "text" name = "id" placeholder= "아이디를 입력하시오"> </td> 
				 	 <input type = "button" value = "중복체크" name= "id_check"> 
			</tr>
			  
			  <tr> <td align = "right"> 비밀번호 : </td> 
				 <td> <input type = "password" name = "pass1" placeholder= "비밀번호를 입력하시오"> </td> 
			</tr>
			  
			  <tr> <td align = "right"> 비밀번호 확인 :  </td> 
				 <td> <input type = "password" name = "pass2" placeholder= "비밀번호 확인"> </td> 
			</tr>
			  
			  <tr> <td align = "right"> 성별 :  </td> 
				 <td> <input type = "radio" name = "sex" value = "m"> 남성 
				 	  <input type = "radio" name = "sex" value = "w"> 여성 
				 </td> 
			</tr>
			  
			
			    <tr> <td align = "right"> 취미 :  </td> 
				 <td>
				 	<input type = "checkbox" name = "hobby1" value = "m1"> 음악 감상 &nbsp;&nbsp;
				 	<input type = "checkbox" name = "hobby2" value = "m2"> 독서 &nbsp;&nbsp;
				 	<input type = "checkbox" name = "hobby3" value = "m3"> 운동 &nbsp;&nbsp;
				 	<input type = "checkbox" name = "hobby4" value = "m4"> 등산 &nbsp;&nbsp;
				 	<input type = "checkbox" name = "hobby5" value = "m5"> 게임 &nbsp;&nbsp;
				 </td> 
			</tr>
			  
				 <tr> <td align = "right"> 전화 번호 :  </td> 
					 <td>
					 	<select name = "nation">
					 		<option value = "000" selected> 대한민국 </option>
					 		<option value = "001"> 미국 </option>
					 		<option value = "002"> 캐나다 </option>
					 		<option value = "003"> 영국 </option>
					 		<option value = "004"> 사우디 </option>
					 	</select>
					 	
					 <select name = "zone">
					 		<option value = "011"> 011 </option>
					 		<option value = "012"> 012 </option>
					 		<option value = "013"> 013 </option>
					 		<option value = "014"> 014 </option>
					 		<option value = "010" selected> 010 </option>
					 		
					 	</select>
					 	<input type = "text" name = "phone1" size = "5" maxlength="4" >
					 	<input type = "text" name = "phone2" size = "5" maxlength="4" >
					 	
					 </td> 
				</tr>
				  
				 
				 <tr> <td align = "right"> 자기 소개서 :  </td> 
					 <td>
					 	<textarea rows="10" cols = "80" name = "profile" placeholder="자기소개"> </textarea>
					 </td> 
				</tr>
			  
				 <tr> <td> 사진 :  </td> 
					 <td>
					 	<input type = "file" name = "file" > * 10MB 이하
					 </td> 
				</tr>
			  	<tr> 
					 <td colspan = "2" ailgn = "center">
					 	<input type = "reset" value = "재 작성"> &nbsp;&nbsp;
					 	<input type = "submit" value = "전송"> 
				</tr>
				
			
			  
 
		
		
		
		</table>
	</form>


</center>


</body>
</html>