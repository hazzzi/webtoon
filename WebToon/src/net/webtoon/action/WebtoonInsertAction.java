package net.webtoon.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("WebtoonInsertAction execute()");
		WebtoonBean wb = new WebtoonBean();
		wb.setWeb_author((String)request.getParameter("web_author"));
		wb.setWeb_subject((String)request.getParameter("web_subject"));
		wb.setWeb_genre((String)request.getParameter("web_genre"));
		wb.setWeb_start((String)request.getParameter("web_start"));
		wb.setWeb_portal((String)request.getParameter("web_portal"));
		wb.setWeb_info((String)request.getParameter("web_info"));
		wb.setWeb_ing((String)request.getParameter("web_ing"));
		wb.setWeb_link((String)request.getParameter("web_link"));
		wb.setWeb_thumb_link((String)request.getParameter("web_thumb_link"));
		
			ActionForward forward = new ActionForward();
		
		
		
		WebtoonDAO wdao=new WebtoonDAO();
		
		if(wdao.insertcheck(wb)){
			
			wdao.insertWebtoon(wb);
			
			
			forward.setRedirect(true);
			forward.setPath("./WebtoonManageListAction.wbt");
		}else{
			response.setContentType("text/html; charset=UTF-8"); // jsp 상단의 contentType과 같게함
			PrintWriter out=response.getWriter(); // response의 권한을 받아오기
			out.println("<script>");
			out.println("alert('이미 등록된 웹툰입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		

		return forward;
	}

}
