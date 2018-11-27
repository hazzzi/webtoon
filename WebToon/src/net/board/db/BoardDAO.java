package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			String sql1 = "select max(fb_num) from free_board";
			pstmt = con.prepareStatement(sql1);
			
			rs = pstmt.executeQuery();
			
			// 첫 행에 데이터가 있으면 가장 큰 번호에 +1
			if(rs.next()){
				fb_num = rs.getInt(1)+1;
			}
			
			String sql = "insert into free_board(fb_num, fb_mem_num, fb_mem_nik, fb_category, fb_subject, fb_content, fb_img, fb_sumlike, fb_readcount, fb_date) values(?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fb_num); //num
				pstmt.setInt(2, bd.getFb_mem_num());
				pstmt.setString(3, bd.getFb_mem_nik());
				pstmt.setString(4, bd.getFb_category());
				pstmt.setString(5, bd.getFb_subject());
				pstmt.setString(6, bd.getFb_content());
				pstmt.setString(7, bd.getFb_img());
				pstmt.setInt(8, 0);
				pstmt.setInt(9, 0);
				// 댓글 수 어떻게? 불러올건지?
			
				
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
	
	public List getBoardList(){
		
		List<BoardBean> boardList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			String sql = "select * from free_board";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				BoardBean bb = new BoardBean();
				bb.setFb_num(rs.getInt(1));
				bb.setFb_mem_num(rs.getInt(2));
				bb.setFb_mem_nik(rs.getString("fb_mem_nik"));
				bb.setFb_category(rs.getString("fb_category"));
				bb.setFb_subject(rs.getString("fb_subject"));
				bb.setFb_content(rs.getString("fb_content"));
				bb.setFb_sumlike(rs.getInt(8));
				bb.setFb_readcount(rs.getInt(9));
				bb.setFb_date(rs.getDate(10));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//예외 발생여부와 상관없이 마지막에 반드시 실행됌(생략 가능)
			//객체생성 기억공간 없애줌
		   if(rs!=null) try{rs.close();}catch (SQLException e2) {}
		   if(pstmt!=null) try{pstmt.close();}catch (SQLException e) {}
		   if(con!=null) try{con.close();}catch (SQLException e) {}
			}
		
		return boardList;
	}
	
	
	}

