package net.rec.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import net.rec.controller.Action;
import net.rec.controller.ActionForward;
import net.rec.db.RecommendDAO;
import net.webtoon.db.WebtoonBean;

public class ShowRecommendAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RecommendDAO rdao = new RecommendDAO();
		List<RecommendedItem> recommendations = rdao.ItemRecommend_list(); // 추천받은 리스트
		for(RecommendedItem recommendation : recommendations){
			System.out.println("추천도 : "+Math.floor(recommendation.getValue()*100)+"%");
		}
		List<WebtoonBean> rec_list = rdao.showRecommend_list(recommendations);
		request.setAttribute("rec_list", rec_list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./recommend/recommend_show.jsp");
		return forward;
	}
}
