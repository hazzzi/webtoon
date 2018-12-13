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
		
		FanBean fb = new FanBean();
		FanDAO fdao = new FanDAO();
		
		HttpSession session = request.getSession();
		String mem_num = (String) session.getAttribute("mem_num");
		int fa_num = Integer.parseInt(request.getParameter("fa_num"));
		int fa_sumlike = Integer.parseInt(request.getParameter("fa_sumlike"));
		
		fb.setFa_mem_num(mem_num);
		fb.setFa_sumlike(fa_sumlike);
		fb.setFa_num(fa_num);
		
		fdao.likeCount(fb);
		
		return null;
	}
	
}
