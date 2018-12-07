package net.webtoon.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SearchDAO {
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
	
	public Vector<List<WebtoonBean>> getSearchResult(String query){
		Vector<List<WebtoonBean>> result = new Vector<List<WebtoonBean>>();
		
		List<WebtoonBean> subject = new ArrayList<WebtoonBean>();
		List<WebtoonBean> author = new ArrayList<WebtoonBean>();
		List<WebtoonBean> portal = new ArrayList<WebtoonBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			query.replaceAll("\\p{Z}", "");
			query = "%"+query.replaceAll("\\p{Z}", "")+"%";
			System.out.println(query);
			// 게시판 글 번호 구하기
			// num 구하기, 게시판 글 중에 가장 큰 번호
			String sql = "select * from webtoon where replace(web_subject,' ','') like ?";
			// 4 저장 <= 결과 실행
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, query);

			rs = pstmt.executeQuery();
			// 5 첫행에 데이터가 있으면 가장큰 번호+1;
			while (rs.next()) {
				WebtoonBean wb = new WebtoonBean();
				wb.setWeb_num(rs.getInt("web_num"));
				wb.setWeb_subject(rs.getString("web_subject"));
				wb.setWeb_author(rs.getString("web_author"));
				wb.setWeb_genre(rs.getString("web_genre"));
				wb.setWeb_start(rs.getString("web_start"));
				wb.setWeb_portal(rs.getString("web_portal"));
				wb.setWeb_info(rs.getString("web_info"));
				wb.setWeb_ing(rs.getString("web_ing"));
				wb.setWeb_link(rs.getString("web_link"));
				wb.setWeb_thumb_link(rs.getString("web_thumb_link"));
				
				subject.add(wb);
			}
			pstmt.close();
			rs.close();
			
			sql ="select * from webtoon where replace(web_author,' ','') like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, query);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				WebtoonBean wb = new WebtoonBean();
				wb.setWeb_num(rs.getInt("web_num"));
				wb.setWeb_subject(rs.getString("web_subject"));
				wb.setWeb_author(rs.getString("web_author"));
				wb.setWeb_genre(rs.getString("web_genre"));
				wb.setWeb_start(rs.getString("web_start"));
				wb.setWeb_portal(rs.getString("web_portal"));
				wb.setWeb_info(rs.getString("web_info"));
				wb.setWeb_ing(rs.getString("web_ing"));
				wb.setWeb_link(rs.getString("web_link"));
				wb.setWeb_thumb_link(rs.getString("web_thumb_link"));
				
				author.add(wb);
			}		
			
			pstmt.close();
			rs.close();
			
			sql ="select * from webtoon where replace(web_portal,' ','') like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, query);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				WebtoonBean wb = new WebtoonBean();
				wb.setWeb_num(rs.getInt("web_num"));
				wb.setWeb_subject(rs.getString("web_subject"));
				wb.setWeb_author(rs.getString("web_author"));
				wb.setWeb_genre(rs.getString("web_genre"));
				wb.setWeb_start(rs.getString("web_start"));
				wb.setWeb_portal(rs.getString("web_portal"));
				wb.setWeb_info(rs.getString("web_info"));
				wb.setWeb_ing(rs.getString("web_ing"));
				wb.setWeb_link(rs.getString("web_link"));
				wb.setWeb_thumb_link(rs.getString("web_thumb_link"));
				
				portal.add(wb);
			}		
			
			result.add(subject);
			result.add(portal);
			result.add(author);
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {	e.printStackTrace();}
			if (con != null)try {con.close();} catch (SQLException e) {	e.printStackTrace();}
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}
			}
		}
		return result;
	}
	
	
	// 같은 장르의 평점을 기준으로 웹툰을 추천함
	// ex) 드라마 장르의 평점이 높은 순서대로 리스트에 뿌려줌
	public List<WebtoonBean> getSimilarity(int web_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String genre = "";
		List<WebtoonBean> list = new ArrayList<WebtoonBean>();
		try {
			con = getConnection();
			String sql = "select web_genre from webtoon where web_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, web_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				genre = rs.getString("web_genre");
			}
			
			pstmt.close();
			rs.close();
			sql = "select w.*, r.avg "
					+ "from webtoon w join "
					+ "(select rec_web_num, round(avg(rec_web_grade),1) avg "
					+ "from recommend group by rec_web_num) r "
					+ "on w.web_num = r.rec_web_num "
					+ "where w.web_genre=? "
					+ "order by r.avg desc;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, genre);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				WebtoonBean wb = new WebtoonBean();
				wb.setWeb_num(rs.getInt("web_num"));
				wb.setWeb_subject(rs.getString("web_subject"));
				wb.setWeb_author(rs.getString("web_author"));
				wb.setWeb_genre(rs.getString("web_genre"));
				wb.setWeb_start(rs.getString("web_start"));
				wb.setWeb_portal(rs.getString("web_portal"));
				wb.setWeb_info(rs.getString("web_info"));
				wb.setWeb_ing(rs.getString("web_ing"));
				wb.setWeb_link(rs.getString("web_link"));
				wb.setWeb_thumb_link(rs.getString("web_thumb_link"));
				
				list.add(wb);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {	e.printStackTrace();}
			if (con != null)try {con.close();} catch (SQLException e) {	e.printStackTrace();}
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}
			}
		}
		
		return list;
	}
}
