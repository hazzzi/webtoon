package net.webtoon.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		WebtoonBean
		WebtoonDAO wdao=new WebtoonDAO();
		wdao.insertWebtoon(webtoon);
		
		return null;
	}

}
