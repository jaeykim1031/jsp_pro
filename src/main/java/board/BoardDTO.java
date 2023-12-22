package board;

import java.sql.Date;
import lombok.Data;

@Data
public class BoardDTO {

	/* client -> controller -> DTO -> DAO -> DB
	 * DB의 board 테이블의 각 컬럼의 값을 매칭해주는 DTO
	 * 	- 접근 제어자는 private
	 * 	- DB의 컬럼과 같은 데이터 형식으로 자료형 지정
	 * 	- 기본 생성자
	 * 	- getter / setter , public 접근 제어자가 지정 
	 * 	- toString() 오버라이드
	 */
	
	private int seq;
	private String title;
	private String wirte;
	private String content;
	private Date regdate;
	private int cnt;
}
