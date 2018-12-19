package net.wtf.comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.wtf.comm.db.CommentsBean;
import net.wtf.comm.db.CommentsDAO;

public class ComsWriteAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ComsWriteAction()");
		request.setCharacterEncoding("utf-8");
		
		CommentsBean cb = new CommentsBean();
		CommentsDAO cd = new CommentsDAO();
		
		HttpSession session = request.getSession();
		String mem_nik = (String)session.getAttribute("mem_nik");		
		String mem_num = (String)session.getAttribute("mem_num");
		System.out.println("ComsWriteAction의 닉네임 : "+ mem_nik);
		System.out.println("ComsWriteAction의 세션 : " + mem_num);
		
		
		if (mem_num == null) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./login.me");
			return forward;
		} else {
		
		int fa_num = Integer.parseInt(request.getParameter("fa_num"));
		System.out.println(fa_num);
        String wtf_content = request.getParameter("wtf_content");
           
        cb.setWtf_mem_num(mem_num);
        cb.setWtf_fa_num(fa_num);
        cb.setWtf_content(wtf_content);
        cb.setWtf_mem_nik(mem_nik);
    	
        cd.insertComment(cb);
        
        
       ActionForward forward = new ActionForward();
       forward.setPath("./fanboardContent.fo?fa_num="+fa_num);
       forward.setRedirect(true);
       
       return forward;
    }
}
}