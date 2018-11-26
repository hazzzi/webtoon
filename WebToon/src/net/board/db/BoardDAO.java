package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private Connection getConnection() throws Exception{
		
		Connection con = null;
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			con = ds.getConnection();
			
		return con;
		
	}// getConnection() DB접속 
	
	public void insertBoard(BoardBean bd){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();

			// 게시판 글 번호 구하기
			int fb_num = 0; 
			
			//가장 큰 num 값 구하는 sql문
			String sql1 = "select max(num) from board";
			pstmt = con.prepareStatement(sql1);
			
			rs = pstmt.executeQuery();
			
			// 첫 행에 데이터가 있으면 가장 큰 번호에 +1
			if(rs.next()){
				fb_num = rs.getInt(1)+1;
			}
			
			String sql = "insert into board values(?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fb_num); //num
				pstmt.setString(2, bd.getFb_category());
				pstmt.setString(3, bd.getFb_img());
				pstmt.setString(4, bd.getFb_subject());
				// 댓글 수 어떻게? 불러올건지?
				pstmt.setString(6, bd.getFb_mem_nik());
				pstmt.setInt(7, bd.getFb_readcount());
				
			//4. sql 실행 및 결과 저장
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			//예외 발생여부와 상관없이 마지막에 반드시 실행됌(생략 가능)
			//객체생성 기억공간 없애줌
		   if(rs!=null) try{rs.close();}catch (SQLException e2) {}
		   if(pstmt!=null) try{pstmt.close();}catch (SQLException e) {}
		   if(con!=null) try{con.close();}catch (SQLException e) {}
			}
		
		 return;
	 
	}//insertBoard end
	}

