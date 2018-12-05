package net.rec.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.main.db.MainDAO;
import net.rec.controller.Action;
import net.rec.controller.ActionForward;
import net.rec.db.RecommendBean;
import net.rec.db.RecommendDAO;

public class InsertRecommendAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		RecommendBean recbean = new RecommendBean();
		recbean.setRec_mem_num((String)session.getAttribute("mem_num")); // ID 고유번호
		recbean.setRec_web_num(Integer.parseInt(request.getParameter("rec_web_num"))); // 웹툰 고유번호
		recbean.setRec_web_grade(Integer.parseInt(request.getParameter("rec_web_grade"))); // 웹툰 별점
		RecommendDAO rdao = new RecommendDAO();
		MainDAO mdao = new MainDAO();
		mdao.insertWebtoonCount(recbean);
		rdao.insertRecommend(recbean);
		
		int sum = rdao.getRecommend((int)session.getAttribute("mem_num"));
		PrintWriter out = response.getWriter();
		out.println(sum);
		return null;
	}
	
}
