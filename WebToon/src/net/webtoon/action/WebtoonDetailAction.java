package net.webtoon.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String num = request.getParameter("num");
		
		if(num!=null){
			int web_num = Integer.parseInt(num);
			
			WebtoonDAO wdao = new WebtoonDAO();
			WebtoonBean wb = wdao.getWebtoon(web_num);
			double score = wdao.getMeanScore(web_num);
			int count = wdao.getCountRec(web_num);
			
			MemberDAO mdao = new MemberDAO();
			
			// 수정 필요. 멤버 추천수 상위 2명만 들고와야함
			MemberBean mb = mdao.getMemberImg(1);

			
			request.setAttribute("wb", wb);
			request.setAttribute("score", score);
			request.setAttribute("count", count);
			request.setAttribute("mb", mb);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./main/search-result.jsp");
			
			return forward;
		}else{
			response.setContentType("text/html; charset=UTF-8"); // jsp 상단의 contentType과 같게함
			PrintWriter out=response.getWriter(); // response의 권한을 받아오기
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
	}

}
