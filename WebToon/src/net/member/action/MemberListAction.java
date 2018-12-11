package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberListAction implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO mdao = new MemberDAO();
		// 리턴값 저장할 변수 mb = getMember(세션값) 메소드 호출
		// ActionForward 객체 생성
		// request 멤버정보 저장
		List<MemberBean> list = mdao.getMemberList();
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/management.jsp");		
		return forward;
	}
	
}
