package net.footer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.footer.controller.Action;
import net.footer.controller.ActionForward;
import net.footer.db.footerBean;
import net.footer.db.footerDAO;

public class footerNoticeupdateAction2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("footerNoticeupdateAction2 execute");
		String ni_category =  request.getParameter("category");
		String ni_subject =  request.getParameter("ni_title");
		String ni_content =  request.getParameter("nicontent");
		String mem_num =  request.getParameter("mem_num");
		int ni_num = Integer.parseInt(request.getParameter("ni_num"));
		footerBean fb = new  footerBean();
		fb.setNi_subject(ni_subject);
		fb.setNi_content(ni_content);
		fb.setNi_category(ni_category);
		fb.setNi_num(ni_num);
		footerDAO fdao = new footerDAO();
		fdao.updatenotice(fb);
	
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./footerNoticeManagerListAction1.ft");
		return forward;
	}

}
