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
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("var con = confirm('삭제 하시겠습니까?')");
		out.println("if(con){");
		out.println("location.href='./MembermanagementDelete2.me'");
		out.println("}else {");
		out.println("history.back();}");
		out.println("</script>");
		out.close();
		
		

		return null;
	}

}
