package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardBean;
import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberDAO;

public class myArticleSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("myArticleSearchAction execute()");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String mem_num=(String)session.getAttribute("mem_num");
		String search =request.getParameter("mt_search");
		System.out.println(mem_num);
		MemberDAO mdao = new  MemberDAO();
		//count는 멤버번호 and 검색어로 한정해서 카운트해야함.
		int count = mdao.getmyboardCount_search(mem_num,search);
		int pageSize=10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		List <BoardBean> myBoardList_search =null;
		
		if(count!=0){
			myBoardList_search = mdao.getmyBoardList_search(startRow,pageSize,mem_num,search);
		}
		
		int pageCount = (count%pageSize==0)? count/pageSize:count/pageSize+1;
		int pageBlock =10;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage= startPage+pageBlock-1;
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("myBoardList_search", myBoardList_search);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/myArticle.jsp");
		
		return forward;
	}

}
