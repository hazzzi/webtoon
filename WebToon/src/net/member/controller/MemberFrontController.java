package net.member.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.action.MembermanagementDelete;
import net.member.action.MemberForgetidAction;
import net.member.action.MemberForgetpwAction;
import net.member.action.MemberJoinAction;
import net.member.action.MemberListAction;
import net.member.action.MemberLoginAction;
import net.member.action.MemberLogoutAction;
import net.member.action.MemberModpassAction;
import net.member.action.MemberUpdateAction1;
import net.member.action.MemberUpdateAction2;
import net.member.action.MemberWithdrawAction;
import net.member.action.MembermyarticleListAction;
import net.member.action.naverLoginAction;
import net.member.action.MemberSearchAction;

public class MemberFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println("가상 주소 확인: " + command);

		ActionForward forward = null;
		Action action = null;

		if (command.equals("/join.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/join.jsp");
		} else if (command.equals("/MemberJoinAction.me")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();

			}
		} else if (command.equals("/login.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/login.jsp");

		} else if (command.equals("/MemberLoginAction.me")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();

			}
		} else if (command.equals("/MemberLogoutAction.me")) {
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();

			}
		} else if (command.equals("/withdrawMember.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/withdrawMember.jsp");

		} else if (command.equals("/myProfile.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/myProfile.jsp");

		} else if (command.equals("/updateForm.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/updateForm.jsp");

		} else if (command.equals("/MemberUpdateAction1.me")) {
			action = new MemberUpdateAction1();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/MemberUpdateAction2.me")) {
			action = new MemberUpdateAction2();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/modPass.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/modPass.jsp");

		} else if (command.equals("/MemberModpassAction.me")) {
			action = new MemberModpassAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/myArticle.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/myArticle.jsp");

		} else if (command.equals("/withdrawMember.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/withdrawMember.jsp");

		} else if (command.equals("/MemberWithdrawAction.me")) {
			action = new MemberWithdrawAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/forgetid.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/forgetid.jsp");

		} else if (command.equals("/MemberForgetidAction.me")) {
			action = new MemberForgetidAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/forgetpw.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/forgetpw.jsp");

		} else if (command.equals("/MemberForgetpwAction.me")) {
			action = new MemberForgetpwAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/adminInsertWebtoon.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./data/webtoon.jsp");
		} else if (command.equals("myWebtoonList.me")) {

		} else if (command.equals("/MembermyarticleListAction.me")) {
			action = new MembermyarticleListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/MembermanagementList.me")) {
			action = new MembermyarticleListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/MembermanagementDelete.me")) {
			action = new MembermanagementDelete();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/memberList.me")) {
			action = new MemberListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/memberSearch.me")) {
			action = new MemberSearchAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if (command.equals("/naverLoginAction.me")) {
			action = new naverLoginAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
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
		// TODO Auto-generated method stub
		System.out.println("MemberFrontController doGet() 메서드");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("MemberFrontController doPost() 메서드");
		doProcess(request, response);
	}

}
