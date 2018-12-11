package net.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String opt_sel = request.getParameter("opt_sel");

		if(opt_sel.equals("id")){
		MemberDAO mbdao = new MemberDAO();
		String search = request.getParameter("mt_search");
		List<MemberBean> mt_search = mbdao.getMemberList_id(search);
		request.setAttribute("mt_search", mt_search);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/management.jsp");		
		
		return forward;
	}else if(opt_sel.equals("email")){
		MemberDAO mbdao = new MemberDAO();
		String search = request.getParameter("mt_search");
		List<MemberBean> mt_search = mbdao.getMemberList_email(search);
		request.setAttribute("mt_search", mt_search);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/management.jsp");		
		
		return forward;
	}
		return null;

	}
}
