package net.rec.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.main.db.MainDAO;
import net.rec.controller.Action;
import net.rec.controller.ActionForward;
import net.rec.db.RecommendDAO;
import net.webtoon.db.WebtoonBean;

public class MainRecommendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RecommendDAO rdao = new RecommendDAO();
		HttpSession session = request.getSession();
		String mem_num = ((String)session.getAttribute("mem_num"));
		
		int count_Recommend = rdao.getRecommend((mem_num));
		request.setAttribute("count_Recommend", count_Recommend); // 평가한 웹툰 수 저장

		List<WebtoonBean> webtoonList = rdao.getWebtoon((mem_num));
		request.setAttribute("webtoonList", webtoonList); // 웹툰LIST 저장

		ActionForward forward = new ActionForward(); // 이동
		forward.setRedirect(false);
		forward.setPath("./recommend/recommend.jsp");
		return forward;
	}
}
