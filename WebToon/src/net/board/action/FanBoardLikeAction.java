package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanBean;
import net.board.db.FanDAO;

public class FanBoardLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("FanBoardLikeAction execute()");

		HttpSession session = request.getSession();
		String mem_num = (String) session.getAttribute("mem_num");
		int fa_num = Integer.parseInt(request.getParameter("fa_num"));

		if (mem_num == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 가능합니다.');");
			out.println("</script>");
			out.close();

		} else {

			FanDAO fdao = new FanDAO();

			boolean check = fdao.likecount(mem_num, fa_num);
			int num = fdao.sumLike(fa_num);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(check+","+num);
			
			
		}
		return null;

	}

}
