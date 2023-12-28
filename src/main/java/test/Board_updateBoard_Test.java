package test;

import board.BoardDAO;
import board.BoardDTO;

public class Board_updateBoard_Test {

	public static void main(String[] args) {
		// 1. BoardDTO에 title, write, content, seq 값
		BoardDTO dto = new BoardDTO();
		dto.setTitle("제목 수정 테스트");
		dto.setWrite("테스트");      // -->  *** VARCHAR2(20) 주의 한글 6글자 이상 불가 ***
		dto.setContent("내용 수정 테스트");
		dto.setSeq(11);
		
		// 2. BoardDAO의 updateBoard(dto) 호출
		BoardDAO dao = new BoardDAO();
		
		dao.updateBoard(dto);
		

	}

}
