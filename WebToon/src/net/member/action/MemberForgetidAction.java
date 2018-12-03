package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberDAO;

public class MemberForgetidAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberForgetidAction execute()");
		
		String email=request.getParameter("email");
		String nik=request.getParameter("nik");
		
		MemberDAO mdao = new MemberDAO();
		String DBId=null;
		DBId=mdao.findId(email,nik);
		String flag="0";
		if(DBId==null){//입력값이 잘못되서 널이 나음.
			flag="0";
		}else{//잘찾아짐
			flag="1";
		}
			System.out.println("찾은 아이디는  "+DBId);
		ActionForward forward = new ActionForward();
		request.setAttribute("flag", flag);
		request.setAttribute("DBId", DBId);
		forward.setRedirect(false);
		forward.setPath("./member/forgetid.jsp");
		return forward;
	}
	
}
