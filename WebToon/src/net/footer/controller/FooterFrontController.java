package net.footer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.footer.action.footerNoticewriteAction;




public class FooterFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ActionForward forward = null;
		Action action =null;
		
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=requestURI.substring(contextPath.length());
		
		if(command.equals("/noticewrite.me")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./footermenu/noticewrite.jsp");

		}else if(command.equals("/footerNoticewriteAction.me")){
			action =new footerNoticewriteAction();
			
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	} 
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("FooterFrontController doGet() 메서드");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("FooterFrontController doPost() 메서드");
		doProcess(request, response);
	}
		
}
