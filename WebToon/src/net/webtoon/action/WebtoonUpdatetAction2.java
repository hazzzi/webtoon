package net.webtoon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonUpdatetAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		WebtoonBean wb = new WebtoonBean();
		wb.setWeb_num(Integer.parseInt(request.getParameter("web_num")));
		wb.setWeb_subject(request.getParameter("web_subject"));
		wb.setWeb_author(request.getParameter("web_author"));
		wb.setWeb_genre(request.getParameter("web_genre"));
		wb.setWeb_start(request.getParameter("web_start"));
		wb.setWeb_portal(request.getParameter("web_portal"));
		wb.setWeb_info(request.getParameter("web_info"));
		wb.setWeb_ing(request.getParameter("web_ing"));
		wb.setWeb_link(request.getParameter("web_link"));
		wb.setWeb_thumb_link(request.getParameter("web_thumb_link"));
		
		WebtoonDAO wbdao =new WebtoonDAO();
		wbdao.updateWebtoon(wb);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath("./WebtoonManageListAction.wbt");
		return forward;
	}

}
