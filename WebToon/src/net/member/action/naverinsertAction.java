package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class naverinsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println();
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		
		MemberBean nmb = (MemberBean)session.getAttribute("nmb");
		
		//System.out.println("네이버 로그인 액션 nmbtest"+nmb.getId());
		
		MemberDAO mdao= new MemberDAO();
		mdao.naverIdinsert(nmb);
		
		session.removeAttribute("nmb");//정보 세션 삭제
		
		session.setAttribute("mem_num", nmb.getNum());
		session.setAttribute("mem_nik", nmb.getNik());
		
		
		ActionForward forward = new ActionForward();
				
				forward.setRedirect(true);
				forward.setPath("./home.today");
		return forward;
	}

}
