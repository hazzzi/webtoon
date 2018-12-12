package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;

public class FanBoardLikeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("FanBoardLikeAction execute()");
		request.setCharacterEncoding("utf-8");
		
		
		
		
		return null;
	}
	
}
