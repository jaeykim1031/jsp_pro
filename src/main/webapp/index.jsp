<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 인덱스 페이지 </title>
</head>
<body>
<!--  모든 웹페이지는 index.jsp 에서 여러 링크로 이루어져 있음 -->
<h2>  INDEX Page</h2>
	<hr>
	<br>
	<a href="getBoardList.do"> 게시판 리스트 페이지 </a>
	<p />
	<a href="insertBoard.jsp"> 게시판 글쓰기 </a>
	<p />

	<a href="getUsersList.do"> 사용자 리스트 페이지 </a>
	<p />
	<a href="insertUsers.jsp"> 사용자 등록 </a>
	<p />
	<a href="LoginForm.jsp"> 로그인 페이지 </a>
	<p />
	<a href="admin.jsp"> 관리자 페이지 </a>
	<p />
	<a href="getProducts.jsp"> 상품 등록 페이지 (관리자만 접근) </a>
	<p />
	<a href="getProductList.do"> 상품 리스트 페이지 (관리자만 접근) </a>
	<p />


</body>

</html>