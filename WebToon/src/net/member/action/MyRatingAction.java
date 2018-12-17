package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberDAO;
import net.rec.db.RecommendDAO;
import net.webtoon.db.WebtoonBean;

public class MyRatingAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mem_num = (String)session.getAttribute("mem_num");
		RecommendDAO rdao = new RecommendDAO();
		int count_Recommend = rdao.getRecommend(mem_num);
		request.setAttribute("count_Recommend", count_Recommend);
		
		MemberDAO mdao = new MemberDAO();
		List<WebtoonBean> myRating_list = mdao.myRating(mem_num);
		request.setAttribute("myRating_list", myRating_list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/myRating.jsp");
		return forward;
	}

}
