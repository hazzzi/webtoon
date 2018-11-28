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
	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();

		return con;

	}// getConnection() DB접속

	public void insertBoard(BoardBean bd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			// 가장 큰 num 값 구하는 sql문
			String sql = "select max(fb_num) from free_board";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			// 첫 행에 데이터가 있으면 가장 큰 번호에 +1
			if (rs.next()) {
				bd.setFb_num(rs.getInt("max(fb_num)") + 1);
			}

			// 충돌방지
			pstmt.close();
			rs.close();

			// member에서 mem_nik 가져오기
			sql = "select mem_nik from member where mem_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bd.getFb_mem_num());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bd.setFb_mem_nik(rs.getString("mem_nik"));
			}

			sql = "insert into free_board(fb_num, fb_mem_num, fb_mem_nik, fb_category, fb_subject, fb_content, fb_img, fb_sumlike, fb_readcount, fb_date)"
					+ " values(?,?,?,?,?,?,?,?,?,now())";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bd.getFb_num()); // num
			pstmt.setInt(2, bd.getFb_mem_num());
			pstmt.setString(3, bd.getFb_mem_nik());
			pstmt.setString(4, bd.getFb_category());
			pstmt.setString(5, bd.getFb_subject());
			pstmt.setString(6, bd.getFb_content());
			pstmt.setString(7, bd.getFb_img());
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			// 댓글 수 어떻게? 불러올건지?

			// 4. sql 실행 및 결과 저장
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외 발생여부와 상관없이 마지막에 반드시 실행됌(생략 가능)
			// 객체생성 기억공간 없애줌
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}

		return;

	}// insertBoard end

	public void updateBoard(BoardBean bd) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();

			String sql = "update free_board set fb_subject=?,fb_content=? where mem_pass=?";
			pstmt = con.prepareStatement(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시판 글 개수 구하기
	public int getBoardCount() {

		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select count(*) from free_board";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}

		return count;

	}

	public int getBoardCount(String search) {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select count(*) from free_board where fb_subject like ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, "%" + search + "%");

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}

		return count;

	}

	// 글 목록 가져오기
	public List<BoardBean> getBoardList(int startRow, int pageSize) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<BoardBean> boardList = new ArrayList<BoardBean>();

		try {

			con = getConnection();

			String sql = "select * from free_board order by fb_num desc" + " limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean bb = new BoardBean();

				bb.setFb_num(rs.getInt("fb_num"));
				bb.setFb_mem_num(rs.getInt("fb_mem_num"));
				bb.setFb_mem_nik(rs.getString("fb_mem_nik"));
				bb.setFb_category(rs.getString("fb_category"));
				bb.setFb_subject(rs.getString("fb_subject"));
				bb.setFb_content(rs.getString("fb_content"));
				bb.setFb_sumlike(rs.getInt("fb_sumlike"));
				bb.setFb_readcount(rs.getInt("fb_readcount"));
				bb.setFb_date(rs.getDate("fb_date"));
					boardList.add(bb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 발생여부와 상관없이 마지막에 반드시 실행됌(생략 가능)
			// 객체생성 기억공간 없애줌
			if (rs != null)
				try {rs.close();
				}catch (SQLException e2) {}
			if (pstmt != null)
				try {pstmt.close();
				} catch (SQLException e) {}
			if (con != null)
				try {con.close();
				} catch (SQLException e) {}
		}

		return boardList;
	}
	
	public void deleteBoard(BoardBean bb){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			String sql = "delete from free_board where fb_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getFb_num());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}
		
		return;
	}
	
	public void updateReadCount(int fb_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = getConnection();
			String sql = "update free_board set fb_readcount=fb_readcount+1 where fb_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fb_num);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}
		
		return;
	}
	public BoardBean getBoard(int bd1){
		BoardBean bd = new BoardBean();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			String sql = "select * from free_board where fb_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bd1);
			
			if(rs.next()){
				bd.setFb_mem_num(rs.getInt("fb_mem_num"));
				bd.setFb_mem_nik(rs.getString("fb_mem_nik"));
				bd.setFb_category(rs.getString("fb_category"));
				bd.setFb_subject(rs.getString("fb_subject"));
				bd.setFb_content(rs.getString("fb_content"));
				bd.setFb_img(rs.getString("fb_img"));
				bd.setFb_sumlike(rs.getShort("fb_sumlike"));
				bd.setFb_readcount(rs.getShort("fb_readcount"));
				bd.setFb_date(rs.getDate("fb_date"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}
		return bd;
	}
	

}
