package net.rec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=requestURI.substring(contextPath.length());
		
		System.out.println("가상 주소 확인: "+command);
		
		ActionForward forward = null;
		Action action =null;
		
		if(command.equals("/board/bd_main")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/bd_main.jsp");
		}
		
		
		//이동 시작
		if(forward!=null){
			if(forward.isRedirect()){
				//true sendRedirect()
				response.sendRedirect(forward.getPath());
			}else{
				//false forward()
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		//이동 끝
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
