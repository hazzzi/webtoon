package net.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.FanBoardList;

public class FanBoardFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println("가상 주소 확인: " + command);	
		
		ActionForward forward = null;
		Action action = null;
		
		
		
		if(command.equals("fanboardWriteAction.bo")){
			
			
			
		}else if(command.equals("/fanboardList.bo")){
			
			action = new FanBoardList();
			
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("")){
			
		}
	}
}
