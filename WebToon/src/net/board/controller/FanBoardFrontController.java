package net.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.FanBoardCategoryAction;
import net.board.action.FanBoardContentAction;
import net.board.action.FanBoardLikeAction;
import net.board.action.FanBoardList;
import net.board.action.FanBoardSearchAction;
import net.board.action.FanBoardWriteAction;
import net.board.action.FanDeleteAction;
import net.board.action.FanModify;
import net.board.action.FanModifyAction;
import net.wtf.comm.action.ComsDeleteAction;
import net.wtf.comm.action.ComsModifyAction;
import net.wtf.comm.action.ComsWriteAction;

public class FanBoardFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println("가상 주소 확인: " + command);

		ActionForward forward = null;
		Action action = null;

		if(command.equals("/fanboardWrite.fo")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/fan_writingPage.jsp");

		}else if(command.equals("/fanboardWriteAction.fo")) {
			
			action = new FanBoardWriteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/fanboardList.fo")) {

			action = new FanBoardList();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/fanCategory.fo")){
			
			action = new FanBoardCategoryAction();
			
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
					
		}else if(command.equals("/fanModify.fo")){
			
			action = new FanModify();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/fanModifyAction.fo")){
			
			action = new FanModifyAction();
			
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();	
			}
			
		}else if(command.equals("/fan_writingPage.fo")){
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/fan_writingPage.jsp");
			
		}else if(command.equals("/fanboardContent.fo")){
			
			action = new FanBoardContentAction();
			
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();	
			}
			
		}else if(command.equals("/fanDelete.fo")){
			
			action = new FanDeleteAction();
			
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();	
			}
		}else if(command.equals("/fanboardSearch.fo")){
			
			action = new FanBoardSearchAction();
			
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/fanboardLikeAction.fo")){
			action =new FanBoardLikeAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/ComsWriteAction.fo")){
				
				action = new ComsWriteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
			}
		
		}	else if(command.equals("/ComsDelete.fo")){
			action = new ComsDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	else if (command.equals("/ComsModifyAction.fo")) {

			action = new ComsModifyAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		

		// 이동 시작
		if (forward != null) {
			if (forward.isRedirect()) {
				// true sendRedirect()
				response.sendRedirect(forward.getPath());
			} else {
				// false forward()
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		// 이동 끝
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
