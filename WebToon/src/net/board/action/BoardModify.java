package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardModify implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardModify execute()");
		request.setCharacterEncoding("utf-8");
		
		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		String pageNum = request.getParameter("pageNum");
		
		HttpSession session = request.getSession();
		String mem_num = (String)session.getAttribute("mem_num");
		
		BoardDAO bdao = new BoardDAO();
		BoardBean bd = bdao.getBoard(fb_num);
		
		request.setAttribute("bd", bd);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/bd_modifyPage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	
}
