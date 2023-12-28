package test;

import board.BoardDAO;
import board.BoardDTO;

public class Board_addCNT_Test {

	public static void main(String[] args) {
		// BoardDto seq 필드의 값 입력
		BoardDTO dto = new BoardDTO();
		dto.setSeq(3);
		
		// BoardDAO의 메서드 호출
		BoardDAO dao = new BoardDAO();
		dao.addCNT(dto);
		

	}

}
