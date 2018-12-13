package net.webtoon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webtoon.action.WebtoonCheckAction;
import net.webtoon.action.WebtoonCommLike;
import net.webtoon.action.WebtoonDetailAction;
import net.webtoon.action.WebtoonInsertAction;
import net.webtoon.action.WebtoonListReview;
import net.webtoon.action.WebtoonManageListAction;
import net.webtoon.action.WebtoonWriteReview;
import net.webtoon.action.WebtoonSearchAction;
import net.webtoon.action.WebtoonUpdatetAction1;
import net.webtoon.action.WebtoonUpdatetAction2;

public class WebtoonFrontController extends HttpServlet{	
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		String command = requestURI.substring(contextPath.length());
		System.out.println("뽑아온 가상주소 "+command);
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/detail.wbt")){
			action = new WebtoonDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/search.wbt")){
			action = new WebtoonSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/writeReview.wbt")){
			action = new WebtoonWriteReview();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/getReview.wbt")){
			action = new WebtoonListReview();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/insertWebtoon.wbt")){//12-10-7-59
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./data/webtoon.jsp");
			
		}else if(command.equals("/webtoonInsertAction.wbt")){//12-10-7-59
			action = new WebtoonInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/WebtoonManageListAction.wbt")){//12-10-7-25
			action = new WebtoonManageListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/WebtoonUpdatetAction1.wbt")){//12-10-7-59
			action = new WebtoonUpdatetAction1();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/WebtoonUpdatetAction2.wbt")){//12-10-7-59
			action = new WebtoonUpdatetAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/check_member.wbt")){
			action = new WebtoonCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/comment_like.wbt")){
			action = new WebtoonCommLike();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// 이동
		if(forward != null){
			if(forward.isRedirect()==true){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemberFrontController doGet()메서드");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemberFrontController doPost()메서드");
		doProcess(request, response);
	}
}
