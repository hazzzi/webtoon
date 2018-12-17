package net.comm.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.board.db.BoardBean;



public class CommentDAO {
	
	private Connection getConnection() throws Exception {

	Connection con = null;
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	con = ds.getConnection();

		return con;
		}
	   //댓글등록
	    public boolean insertComment(CommentBean cb)
	    {
	    	
	        Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
	        boolean result = false;
			
	        System.out.println("dao.insertComment "+cb);
	        try {
	        	 conn = getConnection();
	 
	        	 String sql = "select max(fbcom_bdnum) from fb_comment_board";
	 			pstmt = conn.prepareStatement(sql);

	 			rs = pstmt.executeQuery();

	 			// 첫 행에 데이터가 있으면 가장 큰 번호에 +1
	 			if (rs.next()) {
	 				cb.setFbcom_bdnum(rs.getInt("max(fbcom_bdnum)") + 1);
	 			}

	           sql = "insert into fb_comment_board (fbcom_mem_nik, fbcom_fb_num, fbcom_mem_num, fbcom_bdnum, fbcom_content,fbcom_date,fbcom_re_ref) values(?,?,?,?,?,now(),?)";
	        	 pstmt =conn.prepareStatement(sql.toString());
	            pstmt.setString(1, cb.getFbcom_mem_nik());
	            pstmt.setInt(2, cb.getFbcom_fb_num());
	            pstmt.setString(3, cb.getFbcom_mem_num());
	            pstmt.setInt(4, cb.getFbcom_bdnum());
	            pstmt.setString(5, cb.getFbcom_content());
	            pstmt.setInt(6, 0);
	            pstmt.executeUpdate();
	            
	        } catch (Exception e) {
	          e.printStackTrace();
	        }finally {
	        	try{rs.close();}catch(SQLException s){}
	        	try{pstmt.close();}catch(SQLException s){}
	        }
	        return result;
	    }

	    //댓글목록											//게시글 별로
	    public ArrayList<CommentBean> getCommentList(int fb_num)
	    {
	        ArrayList<CommentBean> CommentList = new ArrayList<CommentBean>();
	        
	        Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			 System.out.println("dao.getCommentList "+fb_num);

				try {

					conn = getConnection();

					String sql = "select * from fb_comment_board where fbcom_fb_num=? order by fbcom_bdnum desc";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, fb_num);
					rs = pstmt.executeQuery();
					
	        	 while(rs.next())
	             {
	        		 CommentBean cb = new CommentBean();
	            
	                 cb.setFbcom_bdnum(rs.getInt("fbcom_fb_num"));
	                 cb.setFbcom_content(rs.getString("fbcom_content"));
	                 cb.setFbcom_bdnum(rs.getInt("fbcom_bdnum"));
	                 cb.setFbcom_mem_nik(rs.getString("fbcom_mem_nik"));
	                 cb.setFbcom_mem_num(rs.getString("fbcom_mem_num"));
	                 cb.setFbcom_date(rs.getDate("fbcom_date"));

	                 CommentList.add(cb);
	             }
	        	 
	         } catch (Exception e) {
		          e.printStackTrace();
		        }finally {
		        	try{rs.close();}catch(SQLException s){}
		        	try{pstmt.close();}catch(SQLException s){}
		        }
				return CommentList;
		    }

	    //댓글삭제
	    public void deleteComment(CommentBean cd) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
				System.out.println("dao.deleteComment  "+cd.getFbcom_bdnum());
			try {
				con = getConnection();
				String sql = "delete from fb_comment_board where fbcom_bdnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cd.getFbcom_bdnum());
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
		}
	    //댓글수정
		public void updateComment(CommentBean cd) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			System.out.println("dao updateComment:  "+cd.getFbcom_content()+"   수정할 댓글번호 : "+cd.getFbcom_bdnum());
			try {
				con = getConnection();
				String sql = "update fb_comment_board set fbcom_content=? where fbcom_bdnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cd.getFbcom_content());
				pstmt.setInt(2, cd.getFbcom_bdnum());
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
		}
		
		public CommentBean getBoard(int fbcom_bdnum) {
			CommentBean cb = new CommentBean();

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = getConnection();
				String sql = "select * from fb_comment_board where fbcom_bdnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fbcom_bdnum);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					cb.setFbcom_bdnum(rs.getInt("fbcom_bdnum"));
					cb.setFbcom_fb_num(rs.getInt("fbcom_fb_num"));
					cb.setFbcom_mem_num(rs.getString("fbcom_mem_num"));
					cb.setFbcom_mem_nik(rs.getString("fbcom_mem_nik"));
					cb.setFbcom_content(rs.getString("fbcom_content"));
					cb.setFbcom_date(rs.getDate("fb_date"));
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
			return cb;
		}
		//댓글 수 카운트 
		public List getCommentCount(List boardList) {
			
			int count =0;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			//리스트 객체생성
			List commentcount = new ArrayList();
			try {

				con = getConnection();
				
				//반복문으로 게시글 가지고와서 쿼리로 카운트
				for(int i=0;i<boardList.size();i++){
					
					BoardBean bb =(BoardBean)boardList.get(i);
					System.out.println(bb.getFb_num());
					
					String sql = "select count(fbcom_fb_num) from fb_comment_board where fbcom_fb_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bb.getFb_num());
					rs = pstmt.executeQuery();
					
					
					if (rs.next()) {
//						rs.getInt("count(fbcom_fb_num)");
						System.out.println(rs.getInt(1));
						commentcount.add(rs.getInt(1));
					}		
						
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

			return commentcount;

		}

		


}