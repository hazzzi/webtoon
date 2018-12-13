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

import net.webtoon.db.WebtoonBean;

public class FanDAO {
	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();

		return con;
	}

	public void insertFan(FanBean fb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
						
			String sql = "select max(fa_num) from webtoon_fanart";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			
			if (rs.next()) {
				fb.setFa_num(rs.getInt("max(fa_num)") + 1);
			}
			
			pstmt.close();
			rs.close();

			sql = "select mem_nik from member where mem_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fb.getFa_mem_num());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				fb.setFa_mem_nik(rs.getString("mem_nik"));
			}
			
			sql = "select web_num from webtoon where web_subject=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,fb.getFa_category2());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				fb.setFa_web_num(rs.getInt("web_num"));
			}
			
			pstmt.close();
			rs.close();


			sql = "insert into webtoon_fanart(fa_num, fa_web_num, fa_mem_num, fa_mem_nik, fa_subject, fa_category1, fa_category2, fa_img, fa_content, fa_sumlike, fa_readcount, fa_date)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fb.getFa_num());
			pstmt.setInt(2, fb.getFa_web_num());
			pstmt.setString(3, fb.getFa_mem_num());
			pstmt.setString(4, fb.getFa_mem_nik());
			pstmt.setString(5, fb.getFa_subject());
			pstmt.setString(6, fb.getFa_category1());
			pstmt.setString(7, fb.getFa_category2());
			pstmt.setString(8, fb.getFa_img());
			pstmt.setString(9, fb.getFa_content());
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);

			pstmt.executeUpdate();

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
		return;
	}// insert end

	public List<String> categoryFan(String fan_category){
		
		List <String> list = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			String sql = "select web_subject from webtoon where web_genre=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,fan_category);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				String tmp = rs.getString("web_subject");
				list.add(tmp);
			}
		
		}catch (Exception e) {
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
		return list;
	}//category 제목 뽑아오기 end

	public int getFanBoardCount(){
		
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();

			String sql = "select count(*) from webtoon_fanart";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt("count(*)");
			}
			
		}catch (Exception e) {
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
		return count;	
	}// fanboard 게시판 글 개수 end
	
	
	public List<FanBean> getBoardList(int startRow, int pageSize){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		
		List<FanBean> boardList = new ArrayList<FanBean>();
		
		try{
			
			con = getConnection();
			
			String sql = "select * from webtoon_fanart order by fa_num desc " + "limit ?,?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FanBean fb = new FanBean();
				
				fb.setFa_num(rs.getInt("fa_num"));
				fb.setFa_mem_num(rs.getString("fa_mem_num"));
				fb.setFa_mem_nik(rs.getString("fa_mem_nik"));
				fb.setFa_subject(rs.getString("fa_subject"));
				fb.setFa_category1(rs.getString("fa_category1"));
				fb.setFa_category2(rs.getString("fa_category2"));
				fb.setFa_content(rs.getString("fa_content"));
				fb.setFa_img(rs.getString("fa_img"));
				fb.setFa_sumlike(rs.getInt("fa_sumlike"));
				fb.setFa_readcount(rs.getInt("fa_readcount"));
				fb.setFa_date(rs.getDate("fa_date"));
				
				boardList.add(fb);
			}
		}catch (Exception e) {	
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
		
		return boardList;
	}// list end
	
	public List<FanBean> getBoardList(int startRow, int pageSize, String search){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		List<FanBean> list = new ArrayList<FanBean>();
		
		try{

			con = getConnection();
			
			String sql = "select * from webtoon_fanart where fa_subject like ? or fa_category1 like ? or fa_category2 like ? or fa_mem_nik like ?"
					 + " limit ?,? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			pstmt.setString(4, "%"+search+"%");
			pstmt.setInt(5, startRow-1);
			pstmt.setInt(6, pageSize);	
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				FanBean fb = new FanBean();
				
				fb.setFa_num(rs.getInt("fa_num"));
				fb.setFa_mem_num(rs.getString("fa_mem_num"));
				fb.setFa_mem_nik(rs.getString("fa_mem_nik"));
				fb.setFa_category1(rs.getString("fa_category1"));
				fb.setFa_category2(rs.getString("fa_category2"));
				fb.setFa_subject(rs.getString("fa_content"));
				fb.setFa_img(rs.getString("fa_img"));
				fb.setFa_sumlike(rs.getInt("fa_sumlike"));
				fb.setFa_readcount(rs.getInt("fa_readcount"));
				fb.setFa_date(rs.getDate("fa_date"));
				
				list.add(fb);
			}
			
			rs.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
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
		return list;	
	}// search end
	
	
	
	
	
	public void updateFanBoard(FanBean fb){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			String sql = "update webtoon_fanart set fa_subject=?, fa_content=?, fa_img=?, fa_category1=?, fa_category2=? where fa_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fb.getFa_subject());
			pstmt.setString(2, fb.getFa_content());
			pstmt.setString(3, fb.getFa_img());
			pstmt.setString(4, fb.getFa_category1());
			pstmt.setString(5, fb.getFa_category2());
			pstmt.setInt(6, fb.getFa_num());
			pstmt.executeUpdate();
					
		}catch (Exception e) {
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
	}// update end
	
	public void deleteFanBoard(FanBean fb){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "delete from webtoon_fanart where fa_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fb.getFa_num());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
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
	}// delete end
	
	public void updateReadCount(int fa_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		try{
			con = getConnection();
			
			
			String sql = "update webtoon_fanart set fa_readcount=fa_readcount+1 where fa_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fa_num);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
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
	}//readcount_update end
	
	public FanBean getFanBoard(int fb1){
		FanBean fb = new FanBean();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			String sql = "select * from webtoon_fanart where fa_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fb1);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				fb.setFa_mem_num(rs.getString("fa_mem_num"));
				fb.setFa_mem_nik(rs.getString("fa_mem_nik"));
				fb.setFa_category1(rs.getString("fa_category1"));
				fb.setFa_category2(rs.getString("fa_category2"));
				fb.setFa_subject(rs.getString("fa_subject"));
				fb.setFa_content(rs.getString("fa_content"));
				fb.setFa_img(rs.getString("fa_img"));
				fb.setFa_sumlike(rs.getInt("fa_sumlike"));
				fb.setFa_readcount(rs.getInt("fa_readcount"));
				fb.setFa_date(rs.getDate("fa_date"));
			}		
		}catch (Exception e) {
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
		return fb;	
	}// getBoard end
	
	public int previousPost(int fa_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int preNum = 0;
		
		try{
			con = getConnection();
			String sql = "select fa_num from webtoon_fanart where fa_num"
					+ "=(select fa_num from webtoon_fanart where fa_num<? "
					+ "order by fa_num desc limit 1)";
			
			pstmt = con.prepareStatement(sql);			
			pstmt.setInt(1, fa_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				preNum = rs.getInt("fa_num");
			}
			
		}catch (Exception e) {
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
		
		return preNum;
		
	}// previousPost end
	
	public int nextPost(int fa_num){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		int nextNum = 0;
		try{
			con = getConnection();
			String sql ="select fa_num from webtoon_fanart where fa_num =(select fa_num from webtoon_fanart where ?<fa_num order by fa_num limit 1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fa_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				nextNum =rs.getInt("fa_num");
			}
		}catch (Exception e) {
			// TODO: handle exception
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
		return nextNum;

	}//nextPost end
	
	public int likeCount(FanBean fb){
		//미완성
		
		int like =0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try{
			con = getConnection();
			String sql = "select fa_likecount from fanart_likecount where fa_mem_num=? and fa_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fb.getFa_mem_num());
			pstmt.setInt(2, fb.getFa_num());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				sql ="delete from fanart_likecount where fa_num=? and fa_mem_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fb.getFa_num());
				pstmt.setString(2, fb.getFa_mem_num());
				pstmt.executeUpdate();
				
				pstmt.close();
				rs.close();
				
				like = fb.getFa_sumlike();
				
				sql ="update webtoon_fanart set fa_sumlike=? where fa_num=? and fa_mem_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fb.getFa_sumlike()-1);
				pstmt.setInt(2, fb.getFa_num());
				pstmt.setString(3, fb.getFa_mem_num());
				
				pstmt.close();
				rs.close();
				
			}else{
				
				sql = "insert into fanart_likecount(fa_num, fa_likecount, fa_mem_num) values(?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fb.getFa_num());
				pstmt.setInt(2, fb.getFa_sumlike()+1);
				pstmt.setString(3, fb.getFa_mem_num());
				pstmt.executeUpdate();
				
				pstmt.close();
				rs.close();
				
				like = fb.getFa_sumlike();
				
				sql ="update webtoon_fanart set fa_sumlike=? where fa_num=? and fa_mem_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fb.getFa_sumlike()+1);
				pstmt.setInt(2, fb.getFa_num());
				pstmt.setString(3, fb.getFa_mem_num());
				
				pstmt.close();
				rs.close();
				
			}
		}catch(Exception e){
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
		
		return like;
	}
}
