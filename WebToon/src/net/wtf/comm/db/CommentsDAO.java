package net.wtf.comm.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CommentsDAO {
		
		private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();

			return con;
			}
		   //댓글등록
		    public boolean insertComment(CommentsBean cb)
		    {
		    	
		        Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
		        boolean result = false;
				
		        System.out.println("dao.insertComment "+cb);
		        try {
		        	 conn = getConnection();
		 
		        	 String sql = "select max(wtf_num) from wtf_comment";
		 			pstmt = conn.prepareStatement(sql);

		 			rs = pstmt.executeQuery();

		 			// 첫 행에 데이터가 있으면 가장 큰 번호에 +1
		 			if (rs.next()) {
		 				cb.setWtf_num(rs.getInt("max(wtf_num)") + 1);
		 			}

		           sql = "insert into wtf_comment (wtf_mem_nik, wtf_fa_num, wtf_mem_num, wtf_num, wtf_content, wtf_date,wtf_re_ref) values(?,?,?,?,?,now(),?)";
		        	 pstmt =conn.prepareStatement(sql.toString());
		            pstmt.setString(1, cb.getWtf_mem_nik());
		            pstmt.setInt(2, cb.getWtf_fa_num());
		            pstmt.setString(3, cb.getWtf_mem_num());
		            pstmt.setInt(4, cb.getWtf_num());
		            pstmt.setString(5, cb.getWtf_content());
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
		    public ArrayList<CommentsBean> getCommentList(int wtf_fa_num)
		    {
		        ArrayList<CommentsBean> CommentList = new ArrayList<CommentsBean>();
		        
		        Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				 System.out.println("dao.getCommentList "+wtf_fa_num);

					try {

						conn = getConnection();

						String sql = "select * from wtf_comment where wtf_fa_num=? order by wtf_num desc";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, wtf_fa_num);
						rs = pstmt.executeQuery();
						
		        	 while(rs.next())
		             {
		        		 CommentsBean cb = new CommentsBean();
		            
		                 cb.setWtf_num(rs.getInt("wtf_num"));
		                 cb.setWtf_content(rs.getString("wtf_content"));
		                 cb.setWtf_num(rs.getInt("wtf_num"));
		                 cb.setWtf_mem_nik(rs.getString("wtf_mem_nik"));
		                 cb.setWtf_mem_num(rs.getString("wtf_mem_num"));
		                 cb.setWtf_date(rs.getDate("wtf_date"));

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
		    public void deleteComment(CommentsBean cd) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
					System.out.println("dao.deleteComment  "+cd.getWtf_num());
				try {
					con = getConnection();
					String sql = "delete from wtf_comment where wtf_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, cd.getWtf_num());
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
			public void updateComment(CommentsBean cd) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				System.out.println("dao updateComment:  "+cd.getWtf_content()+"   수정할 댓글번호 : "+cd.getWtf_num());
				try {
					con = getConnection();
					String sql = "update wtf_comment set wtf_content=? where wtf_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, cd.getWtf_content());
					pstmt.setInt(2, cd.getWtf_num());
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
			
			public CommentsBean getBoard(int fbcom_bdnum) {
				CommentsBean cb = new CommentsBean();

				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {
					con = getConnection();
					String sql = "select * from wtf_comment where wtf_comment=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, fbcom_bdnum);
					rs = pstmt.executeQuery();

					if (rs.next()) {
						cb.setWtf_num(rs.getInt("wtf_num"));
						cb.setWtf_fa_num(rs.getInt("wtf_fa_num"));
						cb.setWtf_mem_num(rs.getString("wtf_mem_num"));
						cb.setWtf_mem_nik(rs.getString("wtf_mem_nik"));
						cb.setWtf_content(rs.getString("wtf_content"));
						cb.setWtf_date(rs.getDate("wtf_date"));
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
			public List<CommentsBean> getCommentCount() {
				
				List<CommentsBean> list = new ArrayList<CommentsBean>(); 
				Connection con = null;
				PreparedStatement pstmt = null; 
				ResultSet rs = null;
				
				try {
					con = getConnection();
					
					String sql = "select wtf_fa_num,count(wtf_fa_num) from wtf_comment group by wtf_fa_num;";
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					
					while (rs.next()) {
						CommentsBean cb = new CommentsBean();
						cb.setWtf_fa_num(rs.getInt("wtf_fa_num"));
						cb.setWtf_fa_num(rs.getInt("count(wtf_fa_num)"));
						System.out.println(cb.getWtf_fa_num());
						list.add(cb);
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

				return list;

			}

			
			


	}