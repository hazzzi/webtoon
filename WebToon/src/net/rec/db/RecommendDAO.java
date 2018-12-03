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

import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.model.JDBCDataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import net.webtoon.db.WebtoonBean;

public class RecommendDAO {
	private Connection getConnection() throws Exception {
		Context init = new InitialContext(); // import javax.naming
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = null;
		con = ds.getConnection(); // getConnection 함수를 통해서 connection 형태로 변환가능
		return con;
	}
	
	public List<WebtoonBean> getWebtoon(int mem_num){
		List<WebtoonBean> list = new ArrayList<WebtoonBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from webtoon where web_num not in (select rec_web_num from recommend where rec_mem_num=?) order by rand()"; //이미 추천한 웹툰은 제외
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num );
			rs = pstmt.executeQuery();
			// 5 첫행에 데이터가 있으면
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
			
				list.add(wb);
			}								
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {	e.printStackTrace();}
			if (con != null)try {con.close();} catch (SQLException e) {	e.printStackTrace();}
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}
			}
		}
		return list;
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
			}else{ //없으면 insert
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
	public int getRecommend(int mem_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sum = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from recommend where rec_mem_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
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
	
	public List<RecommendedItem> UserRecommend_list(int session){
		List<RecommendedItem> recommendations=null;
	      
	      try{
	         MysqlDataSource dataSource = new MysqlDataSource();
	         dataSource.setServerName("192.168.2.9");
	         dataSource.setUser("jspid");
	         dataSource.setPassword("jsppass");
	         dataSource.setDatabaseName("mydb");

			JDBCDataModel dataModel = new MySQLJDBCDataModel(dataSource, "recommend", "rec_mem_num", "rec_web_num",
					"rec_web_grade", null);
	         
	         //UserSimilarity similarity = new PearsonCorrelationSimilarity(dataModel);
	         UserSimilarity similarity = new LogLikelihoodSimilarity(dataModel);
	         UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, similarity, dataModel);
	         UserBasedRecommender recommender = new GenericUserBasedRecommender(dataModel, neighborhood, similarity);
	         recommendations = recommender.recommend(session, 6);
	         for(RecommendedItem recommendation : recommendations){
	            System.out.println(recommendation);
	         }
	      }catch (Exception e) { e.printStackTrace();  }
	      return recommendations;
	}
	public List<WebtoonBean> showRecommend_list(List<RecommendedItem> recommendations){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<WebtoonBean> list = new ArrayList<WebtoonBean>();
		String sql = "";
		try {
			con = getConnection();
				for(RecommendedItem recommendation : recommendations ){
					sql = "select * from webtoon where web_num=?";
					pstmt= con.prepareStatement(sql);
					pstmt.setInt(1, (int)recommendation.getItemID());
					rs = pstmt.executeQuery();
					if(rs.next()){
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
			}
		} catch (Exception e) { e.printStackTrace();	}
		finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {	e.printStackTrace();}
			if (con != null)try {con.close();} catch (SQLException e) {	e.printStackTrace();}
			if(rs!=null)try{rs.close();}catch(SQLException e){e.printStackTrace(); }
		}
		return list;
	}
}
