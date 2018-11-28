package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardContentAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bdao =new BoardDAO();
		
		bdao.updateReadCount(fb_num);
		
		BoardBean bd = bdao.getBoard(fb_num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/bd_detailPage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
