package net.webtoon.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonDAO;

public class WebtoonCommLike implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if(session!=null){
			String mem_num = ((String)session.getAttribute("mem_num"));
			int wbb_bdnum = Integer.parseInt(request.getParameter("wbb_bdnum"));
			
			WebtoonDAO wdao = new WebtoonDAO();
			// 좋아요 이미 되어있으면 true, 아니면 false
			boolean check = wdao.setCommLike(mem_num, wbb_bdnum);
			int num = wdao.sumLike(wbb_bdnum);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(check+","+num);
		}
		return null;
	}
}
