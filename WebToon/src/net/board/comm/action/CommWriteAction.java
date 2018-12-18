package net.board.comm.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.comm.db.CommentBean;
import net.comm.db.CommentDAO;

public class CommWriteAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommWriteAction()");
		request.setCharacterEncoding("utf-8");
		
		CommentBean cb = new CommentBean();
		CommentDAO cd = new CommentDAO();
		
		HttpSession session = request.getSession();
		String mem_nik = (String)session.getAttribute("mem_nik");		
		String mem_num = (String)session.getAttribute("mem_num");
		System.out.println("CommWriteAction의 닉네임 : "+ mem_nik);
		System.out.println("CommWriteAction의 세션 : " + mem_num);
		
		
		if (mem_num == null) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./login.me");
			return forward;
		} else {
		
		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		System.out.println(fb_num);
        String fbcom_content = request.getParameter("fbcom_content");
           
        cb.setFbcom_mem_num(mem_num);
        cb.setFbcom_fb_num(fb_num);
        cb.setFbcom_content(fbcom_content);
        cb.setFbcom_mem_nik(mem_nik);
    	
        cd.insertComment(cb);
        
        
       ActionForward forward = new ActionForward();
       forward.setPath("./boardContent.bo?fb_num="+fb_num);
       forward.setRedirect(true);
       
       return forward;
    }
}
}