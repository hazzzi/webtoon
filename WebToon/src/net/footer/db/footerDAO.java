package net.footer.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class footerDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();

		return con;
	}

	public void writeNotice(footerBean fb) {
		try {
			con = getConnection();

			String sql = "select max(ni_num)from notice_inq_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				fb.setNi_num(rs.getInt("max(ni_num)") + 1);
			}
			rs.close();
			pstmt.close();

			String sql2 = "insert into notice_inq_board"
					+ "(ni_num,ni_mem_num,ni_mem_nik,ni_category,ni_subject,ni_content,ni_date)"
					+ "values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, fb.getNi_num());
			pstmt.setString(2, fb.getNi_num_num());
			pstmt.setString(3, fb.getNi_mem_nik());
			pstmt.setString(4, fb.getNi_category());
			pstmt.setString(5, fb.getNi_subject());
			pstmt.setString(6, fb.getNi_content());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
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

	}

	public int getnoticecount() {
		int count = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from notice_inq_board" + "where ni_category=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "1");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			// TODO: handle exception
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

	public int getqnacount() {
		int count = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from notice_inq_board" + "where ni_category=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "2");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			// TODO: handle exception
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

	public List<footerBean> getNoticelist() {
		List<footerBean> noticeList = new ArrayList<footerBean>();

		try {
			con = getConnection();

			String sql = "select * from notice_inq_board " + "where ni_category=? order by ni_num desc" + "limit ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "1");
			pstmt.setInt(2, 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				footerBean fb = new footerBean();
				fb.setNi_num(rs.getInt("ni_num"));
				fb.setNi_category(rs.getString("ni_category"));
				fb.setNi_content(rs.getString("ni_content"));
				fb.setNi_date(rs.getTimestamp("ni_date"));
				fb.setNi_mem_nik(rs.getString("ni_mem_nik"));
				fb.setNi_subject(rs.getString("ni_subject"));
				fb.setNi_num_num(rs.getString("ni_num_num"));
				noticeList.add(fb);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

		}

		return noticeList;
	}

	public List<footerBean> getqnalist() {
		List<footerBean> qnaList = new ArrayList<footerBean>();

		try {
			con = getConnection();

			String sql = "select * from notice_inq_board " + "where ni_category=? order by ni_num desc" + "limit ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "2");
			pstmt.setInt(2, 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				footerBean fb = new footerBean();
				fb.setNi_num(rs.getInt("ni_num"));
				fb.setNi_category(rs.getString("ni_category"));
				fb.setNi_content(rs.getString("ni_content"));
				fb.setNi_date(rs.getTimestamp("ni_date"));
				fb.setNi_mem_nik(rs.getString("ni_mem_nik"));
				fb.setNi_subject(rs.getString("ni_subject"));
				fb.setNi_num_num(rs.getString("ni_num_num"));
				qnaList.add(fb);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

		}

		return qnaList;
	}

}
