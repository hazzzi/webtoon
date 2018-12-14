package net.footer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.footer.controller.Action;
import net.footer.controller.ActionForward;
import net.footer.db.footerBean;
import net.footer.db.footerDAO;

public class footerNoticeupdateAction1 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("footerNoticeupdateAction1 execute");
		request.setCharacterEncoding("utf-8");
		int ni_num = Integer.parseInt(request.getParameter("ni_num"));
		footerDAO fdao = new footerDAO();
		footerBean fb = new footerBean();
		
		fb=fdao.getnotice(ni_num);
		
		request.setAttribute("fb", fb);

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./footermenu/noticeQnaupdateForm.jsp");
		
		return forward;
	}

}
