package net.board.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String mem_num = (String)session.getAttribute("mem_num");

		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		
		
		ServletContext context = request.getServletContext();
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum==null){
			pageNum="1";
		}
		
		BoardDAO bdao =new BoardDAO();
		
		bdao.updateReadCount(fb_num);
		BoardBean bd = bdao.getBoard(fb_num);
		
		int nextNum = bdao.nextPost(fb_num);
		int preNum = bdao.previousPost(fb_num);	
		
		BoardBean bd2 = bdao.getBoard(nextNum);
		BoardBean bd3 = bdao.getBoard(preNum);
		
		
		request.setAttribute("fb_num", fb_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bd", bd);
		request.setAttribute("nextNum", nextNum);
		request.setAttribute("preNum", preNum);
		request.setAttribute("bd2", bd2);
		request.setAttribute("bd3", bd3);
		
		boolean check = bdao.isLike(mem_num, fb_num);
		request.setAttribute("check", check);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/bd_detailPage.jsp");
		
		
		return forward;
	}

}
