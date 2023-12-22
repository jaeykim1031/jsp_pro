package test;

import board.BoardDAO;
import board.BoardDTO;

public class Board_Insert_Test {

	public static void main(String[] args) {
		
		// 1. DTO 객체 생성 후 값 입력 
		BoardDTO dto = new BoardDTO();
		
			// dto에 setter를 사용해서 값 입력
			dto.setTitle("TEST TITLE 1 ");
			dto.setWirte("user");
			dto.setContent("TEST CONTENT");
		
		// 2. DAO 객체에 insertBoard(dto)
		BoardDAO dao = new BoardDAO();
		
		dao.insertBoard(dto);
		
		
		
		
	}

}
