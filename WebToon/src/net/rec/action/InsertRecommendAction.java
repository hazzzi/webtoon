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
		if(session != null){
			RecommendBean recbean = new RecommendBean();
			String mem_num = ((String)session.getAttribute("mem_num"));
			System.out.println(mem_num);
			recbean.setRec_mem_num(mem_num); // ID 고유번호
			recbean.setRec_web_num(Integer.parseInt(request.getParameter("rec_web_num"))); // 웹툰 고유번호
			recbean.setRec_web_grade(Integer.parseInt(request.getParameter("rec_web_grade"))); // 웹툰 별점
			RecommendDAO rdao = new RecommendDAO();
			MainDAO mdao = new MainDAO();
			mdao.insertWebtoonCount(recbean);
			rdao.insertRecommend(recbean);
			
			int sum = rdao.getRecommend((String)session.getAttribute("mem_num"));
			
			//Ajax의 data로 결과값을 리턴
			PrintWriter out = response.getWriter(); 
			out.println(sum); 
		}
		return null;
	}
}
