package net.rec.db;

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

public class RecommendDAO {
	private Connection getConnection() throws Exception {
		Context init = new InitialContext(); // import javax.naming
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = null;
		con = ds.getConnection(); // getConnection 함수를 통해서 connection 형태로 변환가능
		return con;
	}

	public void insertRecommend(RecommendBean rebean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sum = 0;
		try {
			con = getConnection();
			String sql = "select * from recommend where rec_mem_num=? and rec_web_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rebean.getRec_mem_num());
			pstmt.setInt(2, rebean.getRec_web_num());
			rs = pstmt.executeQuery();
			/* 
			 *  <<<<< 결과 >>>>>
			 * 결과 없으면 " insert into recommend value(?,?,?) "
			 * 
			 * -2.1-. 결과 O + 별점점수도 같다면 " delete from recommend where rec_mem_num and rec_web_num "
			 * -2.2-. 결과 O " update recommend set rec_web_grade=? where rec_mem_num and rec_web_num "
			 * */
			if(rs.next()){ // -2.1-
				if (rebean.getRec_web_grade()==0) { // 0일때 삭제한 이유는 별점 한번 더 클릭시 0값이 들어가기때문
					pstmt.close();
					sql = "delete from recommend where rec_mem_num=? and rec_web_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, rebean.getRec_mem_num());
					pstmt.setInt(2, rebean.getRec_web_num());
					pstmt.executeUpdate();
				}
				else { // -2.2-
					pstmt.close();
					sql = "update recommend set rec_web_grade=? where rec_mem_num=? and rec_web_num=?";
					pstmt = con.prepareStatement(sql);
					System.out.println("update() 실행");
					pstmt.setInt(1, rebean.getRec_web_grade());
					pstmt.setInt(2, rebean.getRec_mem_num());
					pstmt.setInt(3, rebean.getRec_web_num());
					pstmt.executeUpdate();
				}
			}else{
				pstmt.close();
				sql = "insert into recommend value(?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rebean.getRec_mem_num());
				pstmt.setInt(2, rebean.getRec_web_num());
				pstmt.setInt(3, rebean.getRec_web_grade());
				pstmt.executeUpdate();
				rs.close();
			}
		} catch (Exception e) {	e.printStackTrace();	}
		finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {	e.printStackTrace();}
			if (con != null)try {con.close();} catch (SQLException e) {	e.printStackTrace();}
			if(rs!=null)try{rs.close();}catch(SQLException e){e.printStackTrace(); }
		}
	}
	public int getRecommend(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sum = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from recommend";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			sum = rs.getInt(1);
		} catch (Exception e) { e.printStackTrace(); }
		finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {	e.printStackTrace();}
			if (con != null)try {con.close();} catch (SQLException e) {	e.printStackTrace();}
			if(rs!=null)try{rs.close();}catch(SQLException e){e.printStackTrace(); }
		}
		return sum;
	}
}
