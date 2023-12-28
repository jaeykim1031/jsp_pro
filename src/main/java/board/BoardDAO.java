package board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
	
	// DB의 Board 테이블의 모든 레코드를 출력하는 쿼리 : 레코드 여러개, dto -> ArrayList 리턴
	private final String BOARD_LIST = "select * from board order by seq desc";
	
	// DB의 Board 테이블의 글 상세 조회 : 레코드 1개 <- dto
	private final String BOARD_GET = "select * from board where seq = ?";
	
	// DB의 업데이트 쿼리
	private final String BOARD_UPDATE = "update board set title = ?, write = ?, cont = ? where seq = ?";
	
	// Board 테이블의 레코드 삭제
	private final String BOARD_DELETE = "delete board where seq = ?";
	
	// 조회수 증가 쿼리 
	private final String ADD_CNT = "update board set cnt = cnt + 1 where seq = ?";
	
	
	
	
	// insertBoard(BoardDTO dto) 메서드 -> 리턴이 필요 없음 
	
	public void insertBoard(BoardDTO dto) {
		System.out.println("insertBoard 기능 처리");
		
		try {
			
			// conn, pstmt 객체 활성
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(BOARD_INSERT);
			
			// pstmt 객체의 ? 변수 할당
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWrite());		
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
	
	// Board 테이블의 전체 레코드 출력 메서드
	// DB의 레코드 하나를 BoardDTO에 담는다, BoardDTO를 ArrayList에 담는다
	// rs pstmt conn
	public List<BoardDTO> getBoardList(BoardDTO dto) {
		
		// ***** 중요 : ArrayList는 while 밖에서 선언해야 함 *****
		// 			   ArrayList에 저장되는 BoardDTO 선언ㅇ은 while 블록 내부에서 선언
		
		
		List<BoardDTO> boardlist = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection(); 	// conn 객체 활성화 : Oracle ,XE, HR12, 1234
			pstmt = conn.prepareStatement(BOARD_LIST);
			
			// pstmt를 실행 후 rs에 레코드 저장 
			rs = pstmt.executeQuery();
			
			System.out.println("DB select 성공");
			
			// rs의 각 레코드를 BoardDTO에 저장 -> 각 DTO를 ArrayList에 저장
				// if, do ~ while  <->  while 
				// rs.next() : 다음 레코드가 존재하면 true, 커서가 다음 레코드로 이동.
			
			while (rs.next()) {
				// BoardDTo 객체 생성
				BoardDTO board = new BoardDTO();	// 블록 안에서 선언 
				
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWrite(rs.getString("WRITE"));
				board.setRegdate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("cnt"));
				
				// boardList : ArrayList의 add 메서드를 이용, BoardDTO를 저장
				boardlist.add(board);
			}
			
		}catch(Exception e) {
			System.out.println("DB select 실패");
			e.printStackTrace(); 		// 실패 시 콘솔에 오류 정보 출력 
		}finally {
			// 사용한 객체(rs pstmt conn) 반납
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return boardlist;
	}
	
	// 글 상세 조회 : getBoard(dto)
	public BoardDTO getBoard(BoardDTO dto) {
		System.out.println("getBoard 메서드 호출");
		
		addCNT(dto);
		
		BoardDTO board = new BoardDTO();
		
		try {
			conn = JDBCUtil.getConnection();
			// BOARD_GET = "select * from board where seq = ? "
			pstmt = conn.prepareStatement(BOARD_GET);
			pstmt.setInt(1, dto.getSeq());
			
			// rs : 레코드 1개
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWrite(rs.getString("Write"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegdate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				
				System.out.println("RS 레코드를 dto 저장 성공");
			}
			
		}catch (Exception e) {
			
				System.out.println("내용 조회 실패");
				e.printStackTrace();
		}finally {
				JDBCUtil.close(rs, pstmt, conn);
		}
		return board;
	}
	
	// 글 수정 메서드 : updateBoard(dto) -> 리턴이 필요 없음 
	public void updateBoard(BoardDTO dto) {
		System.out.println("updateBoard 호출");
		try {
			conn = JDBCUtil.getConnection();
//			BOARD_UPDATE = "update board set title = ?, write = ?, content = ?, where seq = ?"
			pstmt = conn.prepareStatement(BOARD_UPDATE);
			
			// ? 변수에 값 할당 
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWrite());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getSeq());
			
			pstmt.executeUpdate();	// insert, update, delete 구문일 때 실행
			
			System.out.println(" DB 업데이트 성공 ");
			
			
		}catch (Exception e) {
			System.out.println(" DB 업데이트 실패 ");
			e.printStackTrace();
			
			
		}finally {
			JDBCUtil.close(pstmt, conn);
			
		}
	}
	
	// 글 삭제 메서드 : deleteBoard(dto)
	public void deleteBoard (BoardDTO dto) {
		try {
			conn = JDBCUtil.getConnection();
			// BOARD_DELETE = "delete board where seq = ?"
			pstmt = conn.prepareStatement(BOARD_DELETE);
			
			// ? 변수 할당
			pstmt.setInt(1, dto.getSeq());
			
			// 쿼리 실행
			pstmt.executeUpdate(); // insert update delete
			System.out.println("DB 레코드 삭제 성공");
			
		}catch (Exception e ) {
			System.out.println("DB 레코드 삭제 실패");
			e.printStackTrace();
			
		}finally {
			JDBCUtil.close(pstmt, conn);
		}
	}
	
	// 조회수 증가 메서드 : 
	public void addCNT (BoardDTO dto) {
		// ADD_CNT = "update board set cnt = cnt + 1 where seq = ?"
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(ADD_CNT);
			pstmt.setInt(1, dto.getSeq());
			
			// 쿼리 실행
			pstmt.executeUpdate()	;
			System.out.println(" 조회수 증가 성공");
			
		}catch(Exception e ){
			System.out.println(" 조회수 증가 실패");
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt, conn);
			
		}
	}
}
