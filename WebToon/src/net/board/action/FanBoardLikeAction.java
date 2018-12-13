package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanBean;
import net.board.db.FanDAO;

public class FanBoardLikeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("FanBoardLikeAction execute()");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String mem_num = (String) session.getAttribute("mem_num");
		
		FanDAO fdao = new FanDAO();
		
		int fa_likecount = Integer.parseInt(request.getParameter("fa_likecount"));
		
		FanBean fb = new FanBean();
		
		
		
		return null;
	}
	
}
