package test;

import users.UsersDAO;
import users.UsersDTO;

public class Users_Login_Test {
	public static void main(String[] args) {
		// 1. DTO에 id, password 값 입력
		UsersDTO dto = new UsersDTO();
		dto.setId("users");
		dto.setPassword("1234");
		
		// 2. DAO에 login(dto) 메서드 호출 - 리턴 값이 null이면 인증 실패
		UsersDAO dao = new UsersDAO();
			
			// 리턴 받을 UsersDTO 선언
		UsersDTO user = new UsersDTO();
		
		user = dao.login(dto);
		
		if (user != null ) {
			System.out.println("인증 성공");
			System.out.println(user);

		}else {
			System.out.println("인증 실패");
			System.out.println(user);

		}
		
	}
} 
