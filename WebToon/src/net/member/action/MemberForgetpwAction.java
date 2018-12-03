package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberDAO;

public class MemberForgetpwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
System.out.println("MemberForgetpwAction execute()");
		/*String id=request.getParameter("id");
		String sel_hint=request.getParameter("sel_hint");
		String ans=request.getParameter("ans");*/
		String id=(String)request.getParameter("id");
		String sel_hint=(String)request.getParameter("sel_hint");
		String ans=(String)request.getParameter("ans");
		
		MemberDAO mdao = new MemberDAO();
			
		String DBPw=null;
		DBPw=mdao.findPw(id,sel_hint,ans);
		mdao.findPw(id,sel_hint,ans);
		System.out.println(DBPw);
		String flag="0";
		if(DBPw==null){//입력값이 잘못되서 널이 나음.
			flag="0";
		}else{//잘찾아짐
			flag="1";
		}
			System.out.println("찾은 비번은  "+DBPw);
		ActionForward forward = new ActionForward();
		request.setAttribute("flag", flag);
		request.setAttribute("DBPw", DBPw);
		forward.setRedirect(false);
		forward.setPath("./member/forgetpw.jsp");
		return forward;
	}
	
}
