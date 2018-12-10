package net.main.action;

import java.util.List;
import java.util.Vector;

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
		Vector<List<WebtoonBean>> gender = mdao.getGenderrank();
		List<WebtoonBean> webtoonList = mdao.mainWebtoon();
		List<WebtoonBean> highscore = mdao.highscoreWebtoon();
		List<WebtoonBean> female = gender.get(0);
		List<WebtoonBean> male = gender.get(1);
		List<String> genre = mdao.getWebtoon_genre();
		
		
		
		request.setAttribute("webtoonList", webtoonList);
		request.setAttribute("genre", genre);
		request.setAttribute("female", female);
		request.setAttribute("male", male);
		request.setAttribute("highscore", highscore);
		
		//평가한 웹툰 수
		int count_Recommend = mdao.CountRecommend();
		request.setAttribute("count_Recommend", count_Recommend); // 평가한 웹툰 수 저장
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/main-home.jsp");
		
		return forward;
	}

}
