package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanDAO;

public class FanBoardCategoryAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		String fan_category = request.getParameter("fan_category");
		
		FanDAO fdao = new FanDAO();
		fdao.categoryFan(fan_category);
		
		return null;
	}

}
