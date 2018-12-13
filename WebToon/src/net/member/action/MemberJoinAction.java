package net.member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Data;

import com.sun.prism.PixelFormat.DataType;

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
		String hint=request.getParameter("sel_hint");
		String hintans=request.getParameter("pass_htnt");
		String nik=request.getParameter("nic");
		String ages=request.getParameter("sel_age");
		String gender=request.getParameter("gender");
		/*String progileimg=request.getParameter("progileimg");*/
		
		MemberBean mb = new MemberBean();
		mb.setId(id);
		mb.setPass(pass);
		mb.setEmail(email);
		mb.setHint(hint);
		mb.setHintans(hintans);
		mb.setNik(nik);
		mb.setAges(ages);
		mb.setGender(gender);
		/*mb.setProgileimg(progileimg);*/
		MemberDAO mdao = new MemberDAO();
		
		//아이디가 중복 일떄 false
		//이메일이 중복일떄
		//닉네임이 중복일떄
		
		ActionForward forward = new ActionForward();
		
		
		
		 if(mdao.idOverlapcheck(mb)){
			forward.setRedirect(true);
			forward.setPath("./join.me");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('이미 있는 아이디입니다..');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else if(mdao.nikOverlapcheck(mb)){
			forward.setRedirect(true);
			forward.setPath("./join.me");
			
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('이미 있는 닉네임입니다..');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else if(mdao.emailOverlapcheck(mb)){
			forward.setRedirect(true);
			forward.setPath("./join.me");
				
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('이미 있는 이메일입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else{

			mdao.joinMember(mb);
			forward.setRedirect(true);
			forward.setPath("./login.me");
			
		}

		//위 3가지가 중복체크 성공하면 회원 가입.

		return forward;
	}

}
