package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


// http://localhost:8181/JSP_MVC_M2/*.my
@WebServlet("*.my")
public class Test_Controller01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Test_Controller01() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath()); 
							// Served at: /JSP_MVC_M2 	->	 이렇게 출력 됨
		
		// 클라가 보내는 get
		// 클라가 보내는 host
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("Test Controller 잘 호출 됨");
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
