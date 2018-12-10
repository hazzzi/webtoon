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
import net.board.db.FanBean;
import net.board.db.FanDAO;

public class FanboardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("fanboardWriteAction execute()");
		
		request.setCharacterEncoding("UTF-8");
		
		ServletContext context = request.getServletContext();
		
		int maxSize = 5*1024*1024;
		String filePath = context.getRealPath("./upload");
	    MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());		
		
	    FanBean fb = new FanBean();
		HttpSession session = request.getSession();
		String mem_num = (String)session.getAttribute("mem_num");	    
	    
		if (mem_num == null) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./login.me");
			
			return forward;
			
		}else {
			
			String fa_subject = multi.getParameter("fa_subject");
			String fa_category1 = multi.getParameter("fa_category1");
			String fa_category2 = multi.getParameter("fa_category2");
			String fa_content = multi.getParameter("fa_content");
			String fa_img = multi.getParameter("fa_img");
			
			fb.setFa_mem_num(mem_num);
			fb.setFa_category1(fa_category1);
			fb.setFa_category2(fa_category2);
			fb.setFa_subject(fa_subject);
			fb.setFa_content(fa_content);
			fb.setFa_img(fa_img);

			//화장실 다녀와서 id 세팅할 거야
			
			FanDAO fdao = new FanDAO();
			
			fdao.insertFan(fb);
			
			ActionForward forward = new ActionForward();
			forward.setPath("./fanboardList.bo");
			forward.setRedirect(true);
			
			return forward;

		}
		
	}
	
}
