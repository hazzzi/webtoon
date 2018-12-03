package net.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.BoardContentAction;
import net.board.action.BoardDeleteAction;
import net.board.action.BoardList;
import net.board.action.BoardModifyAction;
import net.board.action.BoardWriteAction;

public class BoardFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println("가상 주소 확인: " + command);

		ActionForward forward = null;
		Action action = null;

		if (command.equals("/boardList.bo")) {
			action = new BoardList();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/bd_writingPage.bo")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/bd_writingPage.jsp");

		} else if (command.equals("/boardContent.bo")) {

			action = new BoardContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/boardWriteAction.bo")) {
			action = new BoardWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardModify.bo")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./board/bd_modifyPage.jsp");
		}else if(command.equals("/boardModifyAction.bo")){
			action = new BoardModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/boardDelete.bo")){
			action = new BoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}/*else if(command.equals("/BoardSearch.bo")){
			action = new BoardSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/

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
