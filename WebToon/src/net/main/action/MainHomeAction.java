package net.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.main.controller.Action;
import net.main.controller.ActionForward;
import net.main.db.MainDAO;
import net.webtoon.db.WebtoonBean;

public class MainHomeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MainDAO mdao = new MainDAO();
		List<WebtoonBean> webtoonList = mdao.mainWebtoon();
		List<String> genre = mdao.getWebtoon_genre();
		
		request.setAttribute("webtoonList", webtoonList);
		request.setAttribute("genre", genre);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/main-home.jsp");
		
		return forward;
	}

}
