package test;

import board.BoardDAO;
import board.BoardDTO;

public class Board_Insert_Test02 {
	public static void main(String[] args) {
		

	// Board 테이블에 값이 잘 들어가는지 테스트 : BoardDTO, BoardDAO - insertBoard(dto)
	
	// 1. BoardDTO에 setter를 사용해 각 필드의 값을 insert
	BoardDTO dto = new BoardDTO();
	dto.setTitle("제목 - 26일");
	dto.setContent("내용 - 26일");
	dto.setWrite("kqe");
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(dto);
	
	
	
	}
}
