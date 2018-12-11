package net.webtoon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonUpdatetAction1 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("WebtoonUpdatetAction1 execute");
		int wbnum=Integer.parseInt(request.getParameter("num"));
		WebtoonDAO wbdao = new WebtoonDAO();
		WebtoonBean wb = wbdao.updategetwebtoon(wbnum);
		System.out.println("업데이트할 웹툰 넘버"+wb.getWeb_num());
		request.setAttribute("wb", wb);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./data/webtoon-update.jsp");
		
		return forward;
	}

}
