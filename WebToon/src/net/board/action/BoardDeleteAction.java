package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BoardDeleteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		
		BoardBean bd = new BoardBean();
		BoardDAO bdao = new BoardDAO();
		
		bd.setFb_num(fb_num);
		
		bdao.deleteBoard(bd);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		
		return forward;
	}
}
