package net.webtoon.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.SearchDAO;
import net.webtoon.db.WebtoonBean;

public class WebtoonSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String query = request.getParameter("query");
		
		SearchDAO sdao = new SearchDAO();
		List<WebtoonBean> result = sdao.getSearchResult(query);
		
		
		request.setAttribute("result", result);
		request.setAttribute("query", query);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/search.jsp");
		
		return forward;
	}

}
