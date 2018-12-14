package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanBean;
import net.board.db.FanDAO;

public class FanModify implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("FanModify execute()");
		request.setCharacterEncoding("utf-8");

		int fa_num = Integer.parseInt(request.getParameter("fa_num"));
		String pageNum = request.getParameter("pageNum");
		
		HttpSession session = request.getSession();
		String mem_num = (String) session.getAttribute("mem_num");

		FanDAO fdao = new FanDAO();
		FanBean fb = fdao.getFanBoard(fa_num);
		
		request.setAttribute("fb", fb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/fan_modifyPage.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
