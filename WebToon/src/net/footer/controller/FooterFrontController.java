package net.footer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.footer.action.footerNoticListAction1;
import net.footer.action.footerNoticeManagerListAction1;
import net.footer.action.footerNoticedeleteAction;
import net.footer.action.footerNoticeupdateAction1;
import net.footer.action.footerNoticeupdateAction2;
import net.footer.action.footerNoticewriteAction;




public class FooterFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ActionForward forward = null;
		Action action =null;
		request.setCharacterEncoding("utf-8");
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=requestURI.substring(contextPath.length());
		
		if(command.equals("/noticewrite.ft")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./footermenu/noticewrite.jsp");

		}else if(command.equals("/footerNoticewriteAction.ft")){
			action =new footerNoticewriteAction();
			
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if(command.equals("/noticeQna.ft")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./footermenu/noticeQna.jsp");
		}else if(command.equals("/footerNoticListAction1.ft")){
			action =new footerNoticListAction1();
			
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if(command.equals("/footerNoticeManagerListAction1.ft")){
			action =new footerNoticeManagerListAction1();
			
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if(command.equals("/footerNoticeupdateAction1.ft")){
			action =new footerNoticeupdateAction1();
			
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if(command.equals("/footerNoticeupdateAction2.ft")){
			action =new footerNoticeupdateAction2();
			
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if(command.equals("/footerNoticedeleteAction.ft")){
			action =new footerNoticedeleteAction();
			
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if(command.equals("/policyPrivacy.ft")){
	         forward = new ActionForward();
	         forward.setRedirect(false);
	         forward.setPath("./footermenu/policyPrivacy.jsp");
	      }else if(command.equals("/termsConditions.ft")){
	         forward = new ActionForward();
	         forward.setRedirect(false);
	         forward.setPath("./footermenu/termsConditions.jsp");
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
