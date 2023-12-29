package Member2;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class Member2DAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private final String MEMBER2_INSERT = 
			"";
	
	
	
	// 회원 가입
	public void insertMember2(Member2DTO) {
		System.out.println("insertMember2 기능");
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(MEMBER2_INSERT);
			
			
		}
	}
	
}
