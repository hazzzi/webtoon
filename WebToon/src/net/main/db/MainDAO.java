package net.main.db;

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

import net.member.db.MemberBean;
import net.rec.db.RecommendBean;
import net.webtoon.db.WebtoonBean;

public class MainDAO {
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
	public int CountRecommend(){
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
	public List<WebtoonBean> mainWebtoon(){
		List<WebtoonBean> list = new ArrayList<WebtoonBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			// 게시판 글 번호 구하기
			// num 구하기, 게시판 글 중에 가장 큰 번호
			String sql = "select * from webtoon"; //전체 웹툰 (test용)
			//String sql = "select * from webtoon where web_num not in (select rec_web_num from recommend)"; //이미 추천한 웹툰은 제외
			// 4 저장 <= 결과 실행
			pstmt = con.prepareStatement(sql);

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
	
	public Vector<List<WebtoonBean>> getGenderrank(){
		Vector<List<WebtoonBean>> list = new Vector<List<WebtoonBean>>();
		
		List<WebtoonBean> female = new ArrayList<WebtoonBean>();
		List<WebtoonBean> male = new ArrayList<WebtoonBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		try {
			con = getConnection();
			
			// 성별로 select 빈도수가 제일 높은순. 동차일경우 최근 입력된 웹툰순으로 
			String sql = "select * from webtoon_rec_gender where webtoon_gender = ? order by webtoon_count desc, webtoon_web_num limit 0,20;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "여");
			
			rs = pstmt.executeQuery();
			// 5 첫행에 데이터가 있으면 가장큰 번호+1;
			while (rs.next()) {
				WebtoonBean wb = new WebtoonBean();
				wb.setWeb_num(rs.getInt("webtoon_web_num"));
				sql = "select * from webtoon where web_num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, wb.getWeb_num());
				
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					wb.setWeb_subject(rs2.getString("web_subject"));
					wb.setWeb_author(rs2.getString("web_author"));
					wb.setWeb_genre(rs2.getString("web_genre"));
					wb.setWeb_start(rs2.getString("web_start"));
					wb.setWeb_portal(rs2.getString("web_portal"));
					wb.setWeb_info(rs2.getString("web_info"));
					wb.setWeb_ing(rs2.getString("web_ing"));
					wb.setWeb_link(rs2.getString("web_link"));
					wb.setWeb_thumb_link(rs2.getString("web_thumb_link"));
				}
				
				female.add(wb);
				
				pstmt2.close();
				rs2.close();
			}
			pstmt.close();
			rs.close();
			
			sql = "select * from webtoon_rec_gender where webtoon_gender = ? order by webtoon_count desc, webtoon_web_num limit 0,20;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "남");
			
			rs = pstmt.executeQuery();
			// 5 첫행에 데이터가 있으면 가장큰 번호+1;
			while (rs.next()) {
				WebtoonBean wb = new WebtoonBean();
				wb.setWeb_num(rs.getInt("webtoon_web_num"));
				sql = "select * from webtoon where web_num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, wb.getWeb_num());
				
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					wb.setWeb_subject(rs2.getString("web_subject"));
					wb.setWeb_author(rs2.getString("web_author"));
					wb.setWeb_genre(rs2.getString("web_genre"));
					wb.setWeb_start(rs2.getString("web_start"));
					wb.setWeb_portal(rs2.getString("web_portal"));
					wb.setWeb_info(rs2.getString("web_info"));
					wb.setWeb_ing(rs2.getString("web_ing"));
					wb.setWeb_link(rs2.getString("web_link"));
					wb.setWeb_thumb_link(rs2.getString("web_thumb_link"));
				}
				
				male.add(wb);
				pstmt2.close();
				rs2.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {	e.printStackTrace();}
			if (con != null)try {con.close();} catch (SQLException e) {	e.printStackTrace();}
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}
			}
		}
		list.add(female);
		list.add(male);
		
		return list;
	}
	
	public List<String> getWebtoon_genre(){
		List<String> list = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			// 게시판 글 번호 구하기
			// num 구하기, 게시판 글 중에 가장 큰 번호
			String sql = "select distinct web_genre from webtoon";
			// 4 저장 <= 결과 실행
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			// 5 첫행에 데이터가 있으면 가장큰 번호+1;
			while (rs.next()) {
				String tmp;
				tmp = rs.getString("web_genre");
				list.add(tmp);
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
	
	public void insertWebtoonCount(RecommendBean recbean){
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		MemberBean mb = new MemberBean();
		int check=0;
		try {
			con = getConnection();
			// member 테이블에서 나이랑 성별을 들고옴
			String sql = "select mem_ages,mem_gender from member where mem_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, recbean.getRec_mem_num());
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mb.setAges(rs.getString("mem_ages"));
				mb.setGender(rs.getString("mem_gender"));
			}
			pstmt.close();
			rs.close();
			
			// 나이 추천 테이블에서 웹툰이랑 연령대를 찾아서 값이 존재하면 update 없으면 insert
			sql = "select * from webtoon_rec_ages where webtoon_web_num=? and webtoon_ages=?";
			System.out.println("select() 실행");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, recbean.getRec_web_num());
			pstmt.setString(2, mb.getAges());
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				sql = "select * from recommend where rec_mem_num=? and rec_web_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, recbean.getRec_mem_num());
				pstmt.setInt(2, recbean.getRec_web_num());
				rs1 = pstmt.executeQuery();
				//System.out.println("select() rec 실행");
				//System.out.println(recbean.getRec_web_grade());
				if(rs1.next()){
					if(recbean.getRec_web_grade()==0){
						pstmt.close();
						sql = "update webtoon_rec_ages set webtoon_count=webtoon_count-1 where webtoon_web_num=? and webtoon_ages=?";
						//System.out.println("update()-1 실행");
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, recbean.getRec_web_num());
						pstmt.setString(2, mb.getAges());
						pstmt.executeUpdate();
					}
				}else{
					pstmt.close();
					sql = "update webtoon_rec_ages set webtoon_count=webtoon_count+1 where webtoon_web_num=? and webtoon_ages=?";
					//System.out.println("update()+1 실행");
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, recbean.getRec_web_num());
					pstmt.setString(2, mb.getAges());
					pstmt.executeUpdate();
				}
			}else{
				pstmt.close();
				sql = "insert into webtoon_rec_ages(webtoon_web_num,webtoon_ages,webtoon_count) value(?,?,?)";
				//System.out.println("insert() 실행");
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, recbean.getRec_web_num());
				pstmt.setString(2, mb.getAges());
				pstmt.setInt(3, 1);
				pstmt.executeUpdate();
			}
			rs.close();
			
			sql = "select * from webtoon_rec_gender where webtoon_web_num=? and webtoon_gender=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, recbean.getRec_web_num());
			pstmt.setString(2, mb.getGender());
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				pstmt.close();
				rs1.close();
				sql = "select * from recommend where rec_mem_num=? and rec_web_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, recbean.getRec_mem_num());
				pstmt.setInt(2, recbean.getRec_web_num());
				rs1 = pstmt.executeQuery();
				if(rs1.next()){
					if(recbean.getRec_web_grade()==0){
						pstmt.close();
						sql = "update webtoon_rec_gender set webtoon_count=webtoon_count-1 where webtoon_web_num=? and webtoon_gender=?";
						//System.out.println("update()-1 실행");
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, recbean.getRec_web_num());
						pstmt.setString(2, mb.getGender());
						pstmt.executeUpdate();
					}
				}else{
					pstmt.close();
					sql = "update webtoon_rec_gender set webtoon_count=webtoon_count+1 where webtoon_web_num=? and webtoon_gender=?";
					//System.out.println("update()+1 실행");
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, recbean.getRec_web_num());
					pstmt.setString(2, mb.getGender());
					pstmt.executeUpdate();
				}
			}else{
				pstmt.close();
				sql = "insert into webtoon_rec_gender(webtoon_web_num,webtoon_gender,webtoon_count) value(?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, recbean.getRec_web_num());
				pstmt.setString(2, mb.getGender());
				pstmt.setInt(3, 1);
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {	e.printStackTrace();}
			if (con != null)try {con.close();} catch (SQLException e) {	e.printStackTrace();}
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}
			}
		}
		
	}
}
