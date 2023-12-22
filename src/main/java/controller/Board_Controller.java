package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet ("*.do")
//  http://localhost:8181/JSP_MVC_M2/*.do
public class Board_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Board_Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

		if (path.equals("insertBoard.do")) {
			System.out.println("insertBoard.do 요청");
			// 로직 처리 
		} else if (path.equals("getBoardList.do " )) {
			System.out.println("getBoardList.do 요청");
		}
		else if (path.equals("updateBoard.do " )) {
			System.out.println("updateBoard.do 요청");
		}
		else if (path.equals("deleteBoard.do " )) {
			System.out.println("deleteBoard.do 요청");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
		
		
	}

}












