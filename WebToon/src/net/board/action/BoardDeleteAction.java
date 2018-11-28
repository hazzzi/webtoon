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
		
		HttpSession session = request.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		
		BoardBean bb = new BoardBean();
		BoardDAO bdao = new BoardDAO();
		
		System.out.println("mem_num");
		
		bdao.deleteBoard(bb);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 완료');");
		out.println("location.href='./BoardList.bo'");
		out.println("</script>");
		out.close();
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);

		return forward;
	}
}
