package net.webtoon.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class WebtoonDAO {

	private Connection getConnection() throws Exception {
		Context init=new InitialContext();// import javax.naming
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB"); 
		// context 파일의 name값을 넣는다, xml에서 name은 마음대로지어도됨
		// object 타입으로 저장되어있어서 (DataSource)로 형변환 해주어야함
		Connection con = null;
		con=ds.getConnection();
		// getConnection 함수를 통해서 connection 형태로 변환가능 
		return con;
	}
	
	public void insertWebtoon(WebtoonBean webtoon) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			con = getConnection();
			// 게시판 글 번호 구하기
			// num 구하기, 게시판 글 중에 가장 큰 번호
			String sql = "select max(web_num) from webtoon";
			// 4 저장 <= 결과 실행
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			// 5 첫행에 데이터가 있으면 가장큰 번호+1;
			while (rs.next()) {
				num=rs.getInt("max(web_num)")+1;
			}								
			// sql insert num구한값 => re_ref
			// re_lev 0, re_seq 0,
			sql = "insert into webtoon(web_num,web_subject,web_author,web_genre,web_start,web_portal,web_info,web_ing,web_link,web_thumb_link) "
					+ "values(?,?,?,?,?,?,?,?,?,?)";		
			
			pstmt = con.prepareStatement(sql);			
			pstmt.setInt(1, num);
			pstmt.setString(2, webtoon.getWeb_subject());
			pstmt.setString(3, webtoon.getWeb_author());
			pstmt.setString(4, webtoon.getWeb_genre());
			pstmt.setString(5, webtoon.getWeb_start());
			pstmt.setString(6, webtoon.getWeb_portal());
			pstmt.setString(7, webtoon.getWeb_info());
			pstmt.setString(8, webtoon.getWeb_ing());
			pstmt.setString(9, webtoon.getWeb_link());
			pstmt.setString(10, webtoon.getWeb_thumb_link());

			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if(rs!=null){
				try{
				rs.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
	}
}