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
		System.out.println("footerNoticewriteAction execute");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String mem_nik= (String)session.getAttribute("mem_nik");
		//String mem_num= (String)session.getAttribute("mem_num");
		String category=request.getParameter("category");
		String ni_content=request.getParameter("nicontent");
		String ni_subject=request.getParameter("ni_title");
		String mem_num=request.getParameter("mem_num");
		footerBean fb = new footerBean();
		fb.setNi_mem_num(mem_num);
		fb.setNi_mem_nik(mem_nik);
		fb.setNi_category(category);
		fb.setNi_content(ni_content);
		fb.setNi_subject(ni_subject);
		
		System.out.println(mem_num);
		System.out.println(fb.getNi_mem_num());
		System.out.println(fb.getNi_mem_nik());
		System.out.println("제목"+fb.getNi_subject());
		System.out.println("내용"+fb.getNi_content());
		System.out.println("카테고리"+fb.getNi_category());
		
		
		footerDAO fd = new footerDAO();
		fd.writeNotice(fb);
		
		
		ActionForward farward = new ActionForward();
		
		farward.setRedirect(true);
		farward.setPath("./footerNoticeManagerListAction1.ft");
		
		return farward;
	}
	
	
}
