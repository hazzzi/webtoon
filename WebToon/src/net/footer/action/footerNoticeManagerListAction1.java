package net.footer.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.footer.controller.Action;
import net.footer.controller.ActionForward;
import net.footer.db.footerBean;
import net.footer.db.footerDAO;

public class footerNoticeManagerListAction1 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
				System.out.println("footerNoticeManagerListAction1 execute");
				
				request.setCharacterEncoding("utf-8");
				footerBean fb =new footerBean();
				footerDAO fd = new footerDAO();
				
				int noticecount = fd.getnoticecount();//notice카운트
				int qnacount=fd.getqnacount();//qna카운트
				System.out.println("noticecount: "+noticecount);
				System.out.println("qnacount: "+qnacount);
				int pageSize=3;
				String n_pageNum = request.getParameter("n_pageNum");
				if(n_pageNum==null){
					n_pageNum="1";
				}
				int n_currentPage = Integer.parseInt(n_pageNum);
				int n_startRow = (n_currentPage-1)*pageSize+1;
				int n_endRow = n_currentPage*pageSize;
				List<footerBean> fbnoticelist = null;
				List<footerBean> fbqnalist = null;
				if(noticecount!=0){
					fbnoticelist=fd.getNoticelist(n_startRow,pageSize);
				}
				int n_pageCount = (noticecount%pageSize==0)? noticecount/pageSize:noticecount/pageSize+1;
				int pageBlock =3;
				int n_startPage = ((n_currentPage-1)/pageBlock)*pageBlock+1;
				int n_endPage= n_startPage+pageBlock-1;
				
				request.setAttribute("noticecount", noticecount);
				request.setAttribute("n_pageNum", n_pageNum);
				
				
				request.setAttribute("n_pageCount", n_pageCount);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("n_startPage", n_startPage);
				request.setAttribute("n_endPage", n_endPage);
				
				
				String q_pageNum = request.getParameter("q_pageNum");
				if(q_pageNum==null){
					q_pageNum="1";
				}
				int q_currentPage = Integer.parseInt(q_pageNum);
				int q_startRow = (q_currentPage-1)*pageSize+1;
				int q_endRow = q_currentPage*pageSize;
			
				if(qnacount!=0){
					fbqnalist=fd.getqnalist(q_startRow,pageSize);
				}
				int q_pageCount = (qnacount%pageSize==0)? qnacount/pageSize:qnacount/pageSize+1;
				
				int q_startPage = ((q_currentPage-1)/pageBlock)*pageBlock+1;
				int q_endPage= q_startPage+pageBlock-1;
				System.out.println("fbqnalist.size()  "+fbqnalist.size());
				request.setAttribute("qnacount", qnacount);
				request.setAttribute("q_pageNum", q_pageNum);
				
				
				request.setAttribute("q_pageCount", q_pageCount);
				request.setAttribute("q_startPage", q_startPage);
				request.setAttribute("q_endPage", q_endPage);
					
					
				
					
					
					List<List> all = new ArrayList<List>();
				all.add(fbnoticelist);
				all.add(fbqnalist);
					
				request.setAttribute("all", all);
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./footermenu/noticeQnaManagement.jsp");
				
				
				return forward;
			}

			
		}
