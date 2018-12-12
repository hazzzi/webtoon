package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class naverLoginAction2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println("naverLoginAction2 execute");
		
		HttpSession session =request.getSession();
		MemberBean nmb=(MemberBean)session.getAttribute("nmb");
		MemberBean getnmb;
		MemberDAO mdao =new MemberDAO();
		
		getnmb=mdao.loginNaver(nmb);
		
		session.setAttribute("mem_num", getnmb.getNum());
		session.setAttribute("mem_nik", getnmb.getNik());
		
		session.removeAttribute("nmb");
		
		ActionForward forward =new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./home.today");
		
		return forward;
	}
	

}
