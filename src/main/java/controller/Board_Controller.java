package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import board.BoardDAO;
import board.BoardDTO;

@WebServlet("*.do")
//  http://localhost:8181/JSP_MVC_M2/*.do
public class Board_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Board_Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		// get, post 요청 모두 처리

		request.setCharacterEncoding("UTF-8");
		System.out.println("do 요청을 처리하는 controller");

		// URL :http://localhost:8181/JSP_MVC_M2/*.do
//									 |	 ↑↑ URI	      |

		String uri = request.getRequestURI();
		System.out.println(uri);

		//
		String path = uri.substring(uri.lastIndexOf("/"));
		System.out.println(path);
		System.out.println("=================================");

		if (path.equals("/insertBoard.do")) {
			System.out.println("/insertBoard.do 요청");
			// 로직 처리

			// 1. 클라이언트에서 넘어오는 변수가 잘 오는지 확인 (클라이언트 요청)
			String title = request.getParameter("title");
			String write = request.getParameter("write");
			String content = request.getParameter("content");

			System.out.println("title : " + title);
			System.out.println("write : " + write);
			System.out.println("content : " + content);

			// 2. 클라이언트에서 넘어오는 변수의 값을 DTO에 setter 입력
			BoardDTO dto = new BoardDTO();
			dto.setTitle(title);
			dto.setWrite(write);
			dto.setContent(content);

			// 3. DAO 에 insertBoard(dto)
			BoardDAO dao = new BoardDAO();
			dao.insertBoard(dto); // insert 성공

			System.out.println("DB 저장 완료");

			// 비즈니스 로직 완료 : DTO, DAO

			// 4. 뷰 페이지 전송 : 값을 insertBoard 후 DB의 전체 레코드 출력 페이지 이동.
			// 클라이언트가 /getBoardList.do를 새로 요청
			// 주의 : http://localhost:8181/getBoardList.do -> 오류
			// 주의 : http://localhost:8181/JSP_MVC_M2/getBoardList.do

			response.sendRedirect("getBoardList.do"); // -> 앞에 '/' 붙으면 안 됨

		} else if (path.equals("/getBoardList.do")) {
			System.out.println("/getBoardList.do 요청");

			// 1. BoardDTO 객체 생성
			BoardDTO dto = new BoardDTO();

			// 2. BoardDTO 객체의 getBoardList(dto)
			BoardDAO dao = new BoardDAO();

			// 리턴 받을 변수 선언
			List<BoardDTO> boardList = new ArrayList();

			// boardList : DB의 Board 테이블 레코드를 dto로 저장 후 ArrayList 내의 각 방에 저장
			boardList = dao.getBoardList(dto);

			// boardList 클라이언트 view 페이지로 전송 : Session 변수에 담아서 클라이언트 뷰페이지로 전송
			// 클라이언트의 세션 정보를 가져와 세션 변수에 할당
			HttpSession session = request.getSession();

			// 세션에 boardList를 추가
			session.setAttribute("boardList", boardList);

			// 클라이언트 뷰 페이지
			response.sendRedirect("getBoardList.jsp");

		} else if (path.equals("/getBoard.do")) {
			System.out.println("getBoard.do 요청");
			// 로직 처리

			// 1. 클라이언트 넘어오는 파라미터 seq 변수의 값을 읽어서 dto에 저장 후 dao.getBoard(dto)
			// http://localhost:8181/JSP_MVC_M2/getBoard.do?seq=5

			int seq = Integer.parseInt(request.getParameter("seq"));

			// 2. dto에 seq 값을 setter 주입
			BoardDTO dto = new BoardDTO();
			dto.setSeq(seq);

			// 3. DAO의 getBoard(dto) 호출 후 리턴 값 받아서 저장
			BoardDAO dao = new BoardDAO();

			// 리턴 값 받을 DTO 선언
			BoardDTO board = new BoardDTO();
			board = dao.getBoard(dto); // **** 이 코드 없으면 원 내용 못 불러옴 

			// 4. 세션 변수에 저장 후 뷰페이지로 전송
			HttpSession session = request.getSession();

			session.setAttribute("board", board);

			// 5. 뷰 페이지
			response.sendRedirect("getBoard.jsp");

		} else if (path.equals("/updateBoard.do")) {
			System.out.println("/updateBoard.do 요청");
			// 로직 처리
			// 1. 클라이언트의 파라미터 변수를 받아 새로운 변수에 저장
			String title = request.getParameter("title");
			String write = request.getParameter("write");
			String content = request.getParameter("content");
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			// 변수값 출력
			System.out.println(title);
			System.out.println(write);
			System.out.println(content);
			System.out.println(seq);
			
			// 2. 변수를 BoardDTO에 setter 주입 
			BoardDTO dto = new BoardDTO();
			dto.setTitle(title);
			dto.setWrite(write);
			dto.setContent(content);
			dto.setSeq(seq);
			
			// 3. BoardDAO에 updateBoard(dto) 호출 
			BoardDAO dao = new BoardDAO();
			dao.updateBoard(dto);
			
			// 4. View page로 이동 - 업데이트 후 리스트 페이지로 이동
			response.sendRedirect("getBoardList.do");
			
			
		} else if (path.equals("/deleteBoard.do")) {
			System.out.println("/deleteBoard.do 요청");
			// 로직 처리
			
			// 1. 클라이언트의 파라미터 값 할당 : seq
			String s_seq = request.getParameter("seq");
			int seq = Integer.parseInt(s_seq);
			
			// 2. 변수의 값을 BoardDTO에 전달
			BoardDTO dto = new BoardDTO();
			dto.setSeq(seq);
			
			// 3. BoardDAO의 메서드 호출 : deleteBoard(dto)
			BoardDAO dao = new BoardDAO();
			dao.deleteBoard(dto);
			
			// 4. View page로 이동
			response.sendRedirect("getBoardList.do");
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
