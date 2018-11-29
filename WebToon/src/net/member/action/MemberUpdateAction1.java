package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberUpdateAction1 implements Action {
	//멤버 정보를 호출 하는 페이지
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateAction1 execute ");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String num=(String)session.getAttribute("mem_num");
		int mem_num=Integer.parseInt(num);
		
		MemberDAO mdao= new MemberDAO();
		
		MemberBean mb=mdao.getMember(mem_num);
		request.setAttribute("mb", mb);
		System.out.println("업데이트  체크"+mb.getId());
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/updateForm.jsp");
		return forward;
	}

	
}
