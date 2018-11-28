package net.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.member.db.MemberDAO;

public class BoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardWriteAction execute()");

		request.setCharacterEncoding("utf-8");

		ServletContext context = request.getServletContext();
		
		int maxSize = 5*1024*1024;
		String filePath = context.getRealPath("./upload");
	    MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		
		BoardBean bd = new BoardBean();
		
		HttpSession session = request.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		
		String fb_category = multi.getParameter("fb_category");
		String fb_subject = multi.getParameter("fb_subject");
		String fb_content = multi.getParameter("fb_content");
		String fb_img = multi.getFilesystemName("fb_img");
				
		bd.setFb_mem_num(mem_num);
		bd.setFb_category(fb_category);
		bd.setFb_subject(fb_subject);
		bd.setFb_content(fb_content);
		bd.setFb_img(fb_img);
		
		BoardDAO bdao = new BoardDAO();
		
		bdao.insertBoard(bd);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		
		return forward;
	}

}
