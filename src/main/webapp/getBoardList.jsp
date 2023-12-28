<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  java.util.* : list, arraylist -->
<%@ page import="java.util.*"%>
<%@ page import="board.BoardDTO"%>

<%
// session 변수에 저장된 ArrayList 불러오기
List<BoardDTO> boardList = new ArrayList<>();

// session 에서 가져온 값(object 타입)을 List 타입으로 변환 
try {
	boardList = (List) session.getAttribute("boardList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
</head>
<body>
	<center>
		<h1>글 목록</h1>
		<hr>

		<table border="1" width="700px">
			<tr>
				<th bgcolor="orange" width="100px">번호</th>
				<th bgcolor="orange" width="200px">제목</th>
				<th bgcolor="orange" width="150px">작성자</th>
				<th bgcolor="orange" width="150px">등록일</th>
				<th bgcolor="orange" width="100px">조회수</th>
			</tr>

			<!--  AList의 BoardDTO를 끄집어내서 출력 : loop 이용 -->
			<%
			for (BoardDTO k : boardList) {
			%>
			<tr>
				<td align="center"><%=k.getSeq()%></td>
				<!-- 제목에 링크를 걸기 - 게시글의 상세 내용을 볼 수 있게. -->
				<td><a href="getBoard.do?seq=<%=k.getSeq()%>"> <%=k.getTitle()%>
				</a></td>
				<td><%=k.getWrite()%></td>
				<td><%=k.getRegdate()%></td>
				<td><%=k.getCnt()%></td>

			</tr>
			<%
			}

			// 모두 사용 됨 : boardList
			// 세션 변수의 값 제거

			session.removeAttribute("boardList");

			} catch (Exception e) {
			response.sendRedirect("getBoardList.do");
			}
			%>
		</table>
		<br> <a href="index.jsp"> 홈으로 </a>
		<br> <a href="insertBoard.jsp"> 새 글 쓰기 </a>
		


</body>
	</center>
</html>