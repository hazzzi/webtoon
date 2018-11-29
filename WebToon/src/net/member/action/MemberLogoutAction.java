package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;

public class MemberLogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
//			System.out.println("MemberLogoutAction execute()");
			response.setContentType("text/html; charset=UTF-8");
			
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			session.invalidate();
					
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃 되었습니다.');");
			out.println("location.href='./login.me';");
			out.println("</script>");
			
			out.close();
			
			
//			ActionForward forward = new ActionForward();
//			forward.setRedirect(true);
//			forward.setPath("./login.me");
			
//		return forward;
			return null;
	}
	

		
}
