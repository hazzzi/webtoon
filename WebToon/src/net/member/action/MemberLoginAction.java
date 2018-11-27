package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println("MemberLoginAction execute()");
		ActionForward forward = new ActionForward();
		
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		MemberDAO mdao = new MemberDAO();
		//DB mem_id를 체크해서 실행되면 성공하면 넘기고 아니면 로그인 폼으로 
		//성공 1 실패 0
		int num = mdao.loginMember(id,pass);
		System.out.println("로그인 여부 num: "+num);
		
		if(num==1){//로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("mem_id", id);
			forward.setRedirect(true);
			forward.setPath("./home.today");
		}else if(num==0){
			forward.setRedirect(true);
			forward.setPath("./login.me");
			
			response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('입력 정보를 확인해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
		}
		
		
		return forward;
	}

}
