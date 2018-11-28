package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.webtoon.db.WebtoonBean;

public class MemberDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();

		return con;
	}

	public void joinMember(MemberBean mb) {


		int mem_num = 0;// 회원 넘버를 만드는 sql문에서 2번쨰 sql문으로 값을 전달하기 위한
						// 변수
		System.out.println(mb.getId());
		System.out.println(mb.getPass());
		System.out.println(mb.getEmail());
		System.out.println(mb.getNik());
		System.out.println(mb.getAges());
		System.out.println(mb.getGender());
		System.out.println(mb.getHintans());
		System.out.println(mb.getHint());
		System.out.println(mb.getDate());
		try {
			con = getConnection();

			// 회원에 각자 넘버가 존재함으로 회원가입시에 회원 넘버를 갱신 시켜준다.
			String sql1 = "select max(mem_num) as mem_num from member";
			pstmt = con.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getInt("mem_num"));
				mem_num = rs.getInt("mem_num") + 1;
			}
			
			// 회원 등록 하는 sql																	,profileimg
			String sql2 = "insert into member(mem_num,mem_id,mem_pass,mem_email,mem_nik,mem_ages,mem_gender,mem_date,mem_hintans,mem_hint) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql2);
			pstmt.setInt(1, mem_num);
			pstmt.setString(2, mb.getId());
			pstmt.setString(3, mb.getPass());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5, mb.getNik());
			pstmt.setString(6, mb.getAges());
			pstmt.setString(7, mb.getGender());
			/*pstmt.setString(8, mb.getProgileimg());*/
			pstmt.setTimestamp(8, mb.getDate());
			pstmt.setString(9, mb.getHintans());
			pstmt.setString(10, mb.getHint());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception 
			e.printStackTrace();
			
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
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
	
	
	
	
	public int loginMember(String mem_id,String mem_pass){
		int num=0;
		try{
			con=getConnection();
			
			String sql="select * from member where mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getString("mem_pass").equals(mem_pass)){
					//로그인 가능하도록 num에 1을 줌
					num=rs.getInt("mem_num"); 
				}else{
					//비번틀림
					num=0;
				}
			} else {
				
				//아이디 틀림
				num=0;
				
			}
			
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
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
		
		
		
		return num;
	}
	
	public MemberBean getMemberImg(int mem_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean mb = new MemberBean();
		try {
			con = getConnection();
			String sql = "select mem_profileimg from member where mem_num=?";
			// 4 저장 <= 결과 실행
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);

			rs = pstmt.executeQuery();
			// 5 첫행에 데이터가 있으면 가장큰 번호+1;
			while (rs.next()) {
				mb.setProgileimg(rs.getString("mem_profileimg"));
			}								
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {	e.printStackTrace();}
			if (con != null)try {con.close();} catch (SQLException e) {	e.printStackTrace();}
			if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}
			}
		}
		return mb;
	}
}
