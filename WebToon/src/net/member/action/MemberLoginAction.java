package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberLoginAction implements Action{

<<<<<<< HEAD
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("utf-8");
      System.out.println("MemberLoginAction execute()");
      ActionForward forward = new ActionForward();
      
      String id=request.getParameter("id");
      String pass=request.getParameter("pass");
      
      MemberDAO mdao = new MemberDAO();
      //DB mem_id를 체크해서 실행되면 성공하면 넘기고 아니면 로그인 폼으로 
      //성공 1 실패 0
      MemberBean mb = mdao.loginMember(id,pass);
      System.out.println("로그인 여부 num: "+mb.getNum());
      
      if(mb.getNum()!=null){//로그인 성공
         HttpSession session = request.getSession();
=======
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println("MemberLoginAction execute()");
		ActionForward forward = new ActionForward();
		
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		
		MemberDAO mdao = new MemberDAO();
		//DB mem_id를 체크해서 실행되면 성공하면 넘기고 아니면 로그인 폼으로 
		//성공 1 실패 0
		MemberBean mb = mdao.loginMember(id,pass);
		System.out.println("로그인 여부 num: "+mb.getNum());
		
		if(mb.getNum()!=null){//로그인 성공
			HttpSession session = request.getSession();

			session.setAttribute("mem_num", mb.getNum());
			session.setAttribute("mem_nik", mb.getNik());
			forward.setRedirect(true);
			forward.setPath("./home.today");
		}else if(mb.getNum()==null){
			forward.setRedirect(true);
			forward.setPath("./login.me");
			
			response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('입력 정보를 확인해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
		}
		
		
		return forward;
	}
>>>>>>> branch 'master' of https://github.com/petbe/webtoon.git

         session.setAttribute("mem_num", mb.getNum());
         session.setAttribute("mem_nik", mb.getNik());
         forward.setRedirect(true);
         forward.setPath("./home.today");
      }else if(mb.getNum()==null){
         forward.setRedirect(true);
         forward.setPath("./login.me");
         
         response.setContentType("text/html; charset=UTF-8");
            PrintWriter out=response.getWriter();
            out.println("<script>");
            out.println("alert('아이디 또는 패스워드가 일치하지 않습니다.');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
      }
      
      
      return forward;
   }

}