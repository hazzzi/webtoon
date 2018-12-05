package net.webtoon.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonBoardBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonListReview implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		WebtoonDAO wdao = new WebtoonDAO();
		//System.out.println("웹툰번호 : "+request.getParameter("num"));
		List<WebtoonBoardBean> webtoonBoardList = wdao.getReview(Integer.parseInt(request.getParameter("num")));
		request.setAttribute("webtoonBoardList", webtoonBoardList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./recommend/rec_comments.jsp");
		return forward;
	}

}
