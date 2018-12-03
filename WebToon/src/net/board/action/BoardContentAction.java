package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardContentAction execute()");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String mem_nik = (String)session.getAttribute("mem_nik");		


		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum==null){
			pageNum="1";
		}
		
		BoardDAO bdao =new BoardDAO();
		
		bdao.updateReadCount(fb_num);
		BoardBean bd = bdao.getBoard(fb_num);
		
		request.setAttribute("fb_num", fb_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bd", bd);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/bd_detailPage.jsp");
		
		return forward;
	}

}
