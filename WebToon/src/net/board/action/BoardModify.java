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
		
		System.out.println("fb_num");
		
		HttpSession session = request.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		
		System.out.println(mem_num);
		
		BoardDAO bdao = new BoardDAO();
//		BoardBean boardbean = bdao.getBoard(mem_num);
		
//		request.setAttribute("boardbean", boardbean);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/bd_modifyPage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	
}
