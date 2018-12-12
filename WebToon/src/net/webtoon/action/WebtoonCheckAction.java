package net.webtoon.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonDAO;

public class WebtoonCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if(session!=null){
			String mem_num = ((String)session.getAttribute("mem_num"));
			int web_num = Integer.parseInt(request.getParameter("web_num"));
			
			WebtoonDAO wdao = new WebtoonDAO();
			boolean check = wdao.isRecommend(mem_num, web_num);
			// ajax 결과 리턴
			PrintWriter out = response.getWriter();
			out.println(check);
		}
		return null;
	}

}
