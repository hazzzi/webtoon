package net.footer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.footer.controller.Action;
import net.footer.controller.ActionForward;
import net.footer.db.footerBean;
import net.footer.db.footerDAO;

public class footerNoticedeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("footerNoticedeleteAction execute");
		int ni_num=Integer.parseInt(request.getParameter("ni_num"));
		
		footerDAO fdao = new footerDAO();
		footerBean fb =  fdao.getnotice(ni_num);
		fdao.deletenotice(ni_num);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath("./footerNoticeManagerListAction1.ft");
		return forward;
	}

}
