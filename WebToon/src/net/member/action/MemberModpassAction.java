package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberDAO;

public class MemberModpassAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println("MemberModpassAction execute()");
		HttpSession session = request.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		String nowpass=request.getParameter("nowpass");
		String newpass=request.getParameter("newpass");
		MemberDAO mdao = new MemberDAO();
		//현재 비번 정확히 입력했다면 1  현재 비번이 틀리면 0
		String DBPass=mdao.checkMemberPass(mem_num);
		ActionForward forward = new ActionForward();
		
		if(DBPass.equals(nowpass)){//디비와 입력된 현재비번 비교
			if(!DBPass.equals(newpass)){//현재 입력된 비번과 새비번이 다른지 비교
				//비번 업데이트 실행
				mdao.updateMem_pass(DBPass, newpass);
				forward.setRedirect(true);
				forward.setPath("./myProfile.me");
				System.out.println("성공");
			}else if(DBPass.equals(newpass)){
				//경고문
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.print("alert('현재와 다른 비밀번호를 입력하세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				System.out.println("비번같음");
			}
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.print("alert('현재 비밀번호가 확인해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			System.out.println("비번틀림");
		}
		return forward;
	}

	
}
