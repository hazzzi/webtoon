package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanDAO;

public class BoardLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardLikeAction execute()");

		HttpSession session = request.getSession();
		String mem_num = (String) session.getAttribute("mem_num");
		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		
		if(mem_num==null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 가능합니다.');");
			out.println("./login.me");
			out.println("</script>");
			out.close();
		}else {
			FanDAO fdao = new FanDAO();
			// 이미 좋아요가 되어 있으면 true, 아니면 false
			boolean check = fdao.likecount(mem_num, fb_num);
			int num = fdao.sumLike(fb_num);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(check+","+num);
		}
		return null;
	}

}
