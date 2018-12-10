package net.footer.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.footer.controller.Action;
import net.footer.controller.ActionForward;
import net.footer.db.footerBean;
import net.footer.db.footerDAO;

public class footerNoticListAction1 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("footerNoticListAction1 execute");
		
		request.setCharacterEncoding("utf-8");
		footerBean fb =new footerBean();
		footerDAO fd = new footerDAO();
		
		int noticecount = fd.getnoticecount();//notice카운트
		int qnacount=fd.getqnacount();//qna카운트
		
		List<footerBean> fbnoticelist = null;
		List<footerBean> fbqnalist = null;
		
		
			fbnoticelist=fd.getNoticelist();
		
		
			fbqnalist=fd.getqnalist();
		List<List> all = new ArrayList<List>();
		
		all.add(fbnoticelist);
		all.add(fbqnalist);
			
		request.setAttribute("all", all);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./footermenu/noitceQna.jsp");
		
		
		return forward;
	}

	
}
