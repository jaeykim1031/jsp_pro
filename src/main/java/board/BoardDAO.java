package board;

import java.sql.*;

import common.JDBCUtil;

public class BoardDAO {
	
	// DAO : DB의 board 테이블 접근하는 객체 - SQL 쿼리
	
	Connection conn = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// sql 쿼리를 상수로
	
	private final String BOARD_INSERT =
			"insert into board (seq, title, write, content)"
			+ " values ((select nvl(max(seq),0) +1 from board ), ?, ?, ?)";
	
	// insertBoard(BoardDTO dto) 메서드 
	
	public void insertBoard(BoardDTO dto) {
		System.out.println("insertBoard 기능 처리");
		
		try {
			
			// conn, pstmt 객체 활성
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(BOARD_INSERT);
			
			// pstmt 객체의 ? 변수 할당
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWirte());		
			pstmt.setString(3, dto.getContent());		
			
			pstmt.executeUpdate();
					
			System.out.println("board 테이블에 insert 완료");
			
		}catch (Exception e) {
			System.out.println("board 테이블에 insert 실패");
			e.printStackTrace();

		} finally {
			// 사용한 객체 제거 
			JDBCUtil.close(pstmt, conn);
		}
		
	}
}
