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
		Vector<List<WebtoonBean>> result = sdao.getSearchResult(query);
		
		List<WebtoonBean> subject = result.get(0);
		List<WebtoonBean> portal = result.get(1);
		List<WebtoonBean> author = result.get(2);
		
		if(subject!=null){
			request.setAttribute("subject", subject);
		}
		if(author!=null){
			request.setAttribute("author", author);
		}
		if(portal!=null){
			request.setAttribute("portal", portal);
		}
		
		request.setAttribute("qurey", query);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/search.jsp");
		
		return forward;
	}

}
