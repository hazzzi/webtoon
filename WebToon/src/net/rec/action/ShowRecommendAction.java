package net.rec.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import net.rec.controller.Action;
import net.rec.controller.ActionForward;
import net.rec.db.RecommendDAO;
import net.webtoon.db.WebtoonBean;

public class ShowRecommendAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RecommendDAO rdao = new RecommendDAO();
		HttpSession session = request.getSession();
		String mem_num = ((String)session.getAttribute("mem_num"));
		List<RecommendedItem> recommendations = rdao.UserRecommend_list((mem_num)); // 추천받은 리스트
		
		List<WebtoonBean> rec_list = (List<WebtoonBean>)rdao.showRecommend_list(recommendations); //추천받은 리스트가지고 웹툰 가져옴
		
		request.setAttribute("rec_list", rec_list);//웹툰 저장
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./recommend/recommend_show.jsp");
		return forward;
	}
}
