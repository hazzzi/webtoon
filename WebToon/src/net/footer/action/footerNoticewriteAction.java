package net.footer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.footer.controller.Action;
import net.footer.controller.ActionForward;
import net.footer.db.footerBean;
import net.footer.db.footerDAO;

public class footerNoticewriteAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//닉네임,멤버넘은 세션 
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String mem_nik= (String)session.getAttribute("mem_nik");
		String mem_num= (String)session.getAttribute("mem_num");
		String category=request.getParameter("category");
		String ni_content=request.getParameter("nicontent");
		String ni_subject=request.getParameter("ni_title");
		System.out.println(mem_num);
		System.out.println(mem_nik);
		footerBean fb = new footerBean();
		fb.setNi_num_num(mem_num);
		fb.setNi_mem_nik(mem_nik);
		fb.setNi_category(category);
		fb.setNi_content(ni_content);
		fb.setNi_subject(ni_subject);
		footerDAO fd = new footerDAO();
		fd.writeNotice(fb);
		System.out.println("제목"+ni_subject);
		System.out.println("내용"+ni_content);
		System.out.println("카테고리"+category);
		
		ActionForward farward = new ActionForward();
		
		farward.setRedirect(true);
		farward.setPath("./noticewrite.me");
		
		return farward;
	}
	
	
}
