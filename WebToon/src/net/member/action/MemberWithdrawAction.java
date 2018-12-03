package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberDAO;

public class MemberWithdrawAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
			System.out.println("MemberWithdrawAction execute()");
			HttpSession session = request.getSession();
			int mem_num = (int)session.getAttribute("mem_num");
			
			MemberDAO mdao = new MemberDAO();
			String DBPass = mdao.checkMemberPass(mem_num);
			String nowpass = request.getParameter("pass");
			ActionForward forward = new ActionForward();
			if(DBPass.equals(nowpass)){//같으면 삭제
				mdao.deleteMember(mem_num);
				forward.setRedirect(true);
				forward.setPath("./login.me");
			}else{//다르면 백
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호를 확인해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			
		return forward;
	}

	
}
