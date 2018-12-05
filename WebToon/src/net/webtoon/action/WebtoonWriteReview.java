package net.webtoon.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonBoardBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonWriteReview implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_num")==null){
			response.setContentType("text/html; charset=UTF-8"); // jsp 상단의 contentType과 같게함
			PrintWriter out=response.getWriter(); // response의 권한을 받아오기
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		WebtoonBoardBean wbb = new WebtoonBoardBean();
		WebtoonDAO wdao = new WebtoonDAO();
		MemberDAO mdao = new MemberDAO();

		int wbb_web_num = 0;
		if(request.getParameter("wbb_web_num")!=null){
			wbb_web_num = Integer.parseInt(request.getParameter("wbb_web_num"));
		}
		wbb.setWbb_web_num(wbb_web_num);
		
		String wbb_mem_num = (String)session.getAttribute("mem_num");
		wbb.setWbb_mem_num(wbb_mem_num);
		wbb.setWbb_mem_nik(mdao.getMember(wbb_mem_num).getNik());
		
		String wbb_comment = request.getParameter("wbb_comment");
		wbb.setWbb_comment(wbb_comment);
		wbb.setWbb_sumlike(0);
		
		wdao.writeReview(wbb);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./getReview.wbt");
		
		return forward;
	}

}
