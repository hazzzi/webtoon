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

public class FanboardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("fanboardWriteAction execute()");
		
		request.setCharacterEncoding("UTF-8");
		
		ServletContext context = request.getServletContext();
		
		int maxSize = 5*1024*1024;
		String filePath = context.getRealPath("./upload");
	    MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());		
		
	    BoardBean bd = new BoardBean();
	    
		HttpSession session = request.getSession();
		String mem_num = (String)session.getAttribute("mem_num");	    
	    
		if (mem_num == null) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./login.me");
			
			return forward;
			
		}else {

			String fb_category = multi.getParameter("fb_"+"fb_category");
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
			forward.setPath("./fanboardList.bo");
			forward.setRedirect(true);
			
			return forward;
		}
		
	}
	
}
