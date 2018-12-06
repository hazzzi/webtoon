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
				fb.setFa_num(rs.getInt("max(fa_num)" + 1));
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

			sql = "insert into webtoon_fanart(fa_num, fa_web_num, fa_mem_num, fa_mem_id, fa_mem_nik, fa_subject, fa_category1, fa_category2, fa_img, fa_content, fa_sumlike, fa_readcount, fa_date)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fb.getFa_num());
			pstmt.setInt(2, fb.getFa_web_num());
			pstmt.setString(3, fb.getFa_mem_num());
			pstmt.setString(4, fb.getFa_mem_id());
			pstmt.setString(5, fb.getFa_mem_nik());
			pstmt.setString(6, fb.getFa_subject());
			pstmt.setString(7, fb.getFa_category1());
			pstmt.setString(8, fb.getFa_category2());
			pstmt.setString(9, fb.getFa_img());
			pstmt.setString(10, fb.getFa_content());
			pstmt.setInt(11, 0);
			pstmt.setInt(12, 0);

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
	}

}
