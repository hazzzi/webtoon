package net.board.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanBean;
import net.board.db.FanDAO;

public class FanDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("FanDeleteAction execute()");
		request.getParameter("utf-8");

		int fa_num = Integer.parseInt(request.getParameter("fa_num"));

		FanBean fb = new FanBean();
		FanDAO fdao = new FanDAO();

		fb.setFa_num(fa_num);

		fdao.deleteFanBoard(fb);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 삭제하였습니다 ')");
		out.println("</script>");
		out.close();
		
		ActionForward forward = new ActionForward();
		forward.setPath("./fanboardList.fo");
		forward.setRedirect(true);

		return forward;
	}

}
