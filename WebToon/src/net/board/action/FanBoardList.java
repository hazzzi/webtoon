package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanBean;
import net.board.db.FanDAO;

public class FanBoardList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("fanboardList execute()");
		
		request.setCharacterEncoding("utf-8");
		
		FanDAO fdao = new FanDAO();
		
		int count = fdao.getFanBoardCount();
		int pageSize = 20;
		String pageNum = request.getParameter("pageNum");
			
		if(pageNum==null){
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		List <FanBean> fanboardList = null;
		if(count!=0){
			fanboardList = fdao.getBoardList(startRow, pageSize);
		}
		
		int pageCount = (count%pageSize==0)? count/pageSize:count/pageSize+1;
		int pageBlock = 10;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("fanboardList", fanboardList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/fanart.jsp");
		
		return forward;
	}

}
