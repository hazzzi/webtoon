package net.rec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.rec.action.InsertRecommendAction;
import net.rec.action.MainRecommendAction;
import net.rec.action.ShowRecommendAction;

public class RecommendFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RecommendFrontController doProcess()");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);

		ActionForward forward = null;
		Action action = null;

		// 웹툰 평가(별점) 페이지
		if(command.equals("/main_recommend.rec")){
			action = new MainRecommendAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {	e.printStackTrace(); }
		// 웹툰 평가(별점) insert작업
		}else if(command.equals("/recDB_insert.rec")){
			action = new InsertRecommendAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {	e.printStackTrace();	}
		// 웹툰 추천 페이지
		}else if(command.equals("/recommend_show.rec")){
			action = new ShowRecommendAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {	e.printStackTrace();	}
		}
		
		
		// 주소 이동
		if (forward != null) {
			// 이동 방식
			// ture : response.sendRedirect
			// false : dispatcher.forward
			if (forward.isRedirect() == true) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RecommendFrontController doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RecommendFrontController doPost()");
		doProcess(request, response);
	}

}
