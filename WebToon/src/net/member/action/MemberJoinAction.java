package net.member.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberJoinAction execute()");

		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String email=request.getParameter("email");
		String hint=request.getParameter("hint");
		String hintans=request.getParameter("hintans");
		String nik=request.getParameter("nik");
		String ages=request.getParameter("ages");
		String gender=request.getParameter("gender");
		String progileimg=request.getParameter("progileimg");
		
		
		MemberBean mb = new MemberBean();
		mb.setId(id);
		mb.setPass(pass);
		mb.setEmail(email);
		mb.setHint(hintans);
		mb.setHintans(hintans);
		mb.setNik(nik);
		mb.setAges(ages);
		mb.setGender(gender);
		mb.setProgileimg(progileimg);
		MemberDAO mdao = new MemberDAO();
		
		mdao.JoinMember(mb);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./loginForm.me");
		return forward;
	}

}
