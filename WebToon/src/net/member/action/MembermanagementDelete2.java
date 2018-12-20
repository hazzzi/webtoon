package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MembermanagementDelete2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String delmem_num = (String)session.getAttribute("delmem_num");
//		String mem_num = (String)request.getParameter("mem_num");
		MemberDAO mdao = new MemberDAO();
		ActionForward forward = new ActionForward();
		MemberBean mb=new MemberBean();
		mb=mdao.getMember(delmem_num);
		mdao.deleteMember(mb);
		forward.setRedirect(true);
		forward.setPath("./memberList.me");
		return forward;
	}

}
