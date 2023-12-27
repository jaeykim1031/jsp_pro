package test;

import java.util.ArrayList;
import java.util.List;

import board.BoardDAO;
import board.BoardDTO;

public class Board_getBoardList_Test {

	public static void main(String[] args) {
		
		// BoardDAO의 getBoardList(dto) 메서드 테스트
		
		// 1. BoardDTO 객체 생성
		BoardDTO dto = new BoardDTO();
		
		// 2. BoardDAO 객체 생성 , 메서드 호출
		BoardDAO dao = new BoardDAO();

		// ArrayList 선언 : <BpardDAO> 객체가 각 방에 들어가 있음 
		 
		List<BoardDTO> boardList = new ArrayList<>();
		
		//boardList DB의 각 레코드를  DTO에 담아서 저장
		
		boardList = dao.getBoardList(dto);
		
		// ArrayList : boardList의 각 방의 BoardDTO 객체를 순환 하면서 객체 출력
		
		System.out.println( " for 문" );
		for (int i = 0 ; i < boardList.size() ; i ++) {
			System.out.println(boardList.get(i));
		}
		
		System.out.println(" enhanced for 문");
		for ( BoardDTO b : boardList) {
			System.out.println(b);
		}
		
		
		
	}

}
