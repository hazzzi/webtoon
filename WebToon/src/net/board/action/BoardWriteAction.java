package net.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardWriteAction execute()");

		request.setCharacterEncoding("utf-8");

		ServletContext context = request.getServletContext();
		String filePath = context.getRealPath("/upload");
		MultipartRequest multi = null;
		
		BoardBean bd = new BoardBean();

		int fb_mem_num = Integer.parseInt(multi.getParameter("fb_mem_num"));
		String fb_mem_nik = multi.getParameter("fb_mem_nik");
		String fb_category = multi.getParameter("fb_category");
		String fb_subject = multi.getParameter("fb_subject");
		String fb_content = multi.getParameter("fb_content");
		String fb_img = multi.getParameter("fb_img");
		
		bd.setFb_mem_num(fb_mem_num);
		bd.setFb_mem_nik(fb_mem_nik);
		bd.setFb_category(fb_category);
		bd.setFb_subject(fb_subject);
		bd.setFb_content(fb_content);
		bd.setFb_img(fb_img);
		
		BoardDAO bdao = new BoardDAO();
		
		bdao.insertBoard(bd);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./bd_main.bo");
		forward.setRedirect(true);
		
		return forward;
	}

}
