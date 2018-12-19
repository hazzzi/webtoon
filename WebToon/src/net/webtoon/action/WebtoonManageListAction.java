package net.webtoon.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonManageListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("WebtoonManageListAction execute()");
		List<WebtoonBean> wbList = null;
		WebtoonDAO wbtdao = new WebtoonDAO();
		wbList=wbtdao.getWebtoonList();
		request.setAttribute("wbList", wbList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./data/webtoonlist.jsp");
		return forward;
	}

}
