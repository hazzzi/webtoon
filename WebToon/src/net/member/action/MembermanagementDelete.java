package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberDAO;

public class MembermanagementDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String delmem_num=request.getParameter("mem_num");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("delmem_num",delmem_num);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MembermanagementDelete2.me");	

		return forward;
	}

}
