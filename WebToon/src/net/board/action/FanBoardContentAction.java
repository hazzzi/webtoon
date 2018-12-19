package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanBean;
import net.board.db.FanDAO;
import net.wtf.comm.db.CommentsBean;
import net.wtf.comm.db.CommentsDAO;

public class FanBoardContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("FanBoardContentAction execute()");
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String mem_nik = (String)session.getAttribute("mem_nik");
		String mem_num = (String)session.getAttribute("mem_num");
		
		int fa_num = Integer.parseInt(request.getParameter("fa_num"));
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		
		FanDAO fdao = new FanDAO();
		fdao.updateReadCount(fa_num);
		
		FanBean fb = fdao.getFanBoard(fa_num);
		int nextNum = fdao.nextPost(fa_num);
		int preNum = fdao.previousPost(fa_num);	
		
		FanBean fb2 = fdao.getFanBoard(nextNum);
		FanBean fb3 = fdao.getFanBoard(preNum);
		
		//댓글출력
		String wtf_content = request.getParameter("new_content");
		CommentsDAO cdao = new CommentsDAO();
		List<CommentsBean> CommentsList = cdao.getCommentList(fa_num);
		request.setAttribute("CommentsList", CommentsList);
		//댓글출력
		
		request.setAttribute("fa_num", fa_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("fb", fb);
		request.setAttribute("nextNum", nextNum);
		request.setAttribute("preNum", preNum);
		request.setAttribute("fb2", fb2);
		request.setAttribute("fb3", fb3);
		
		boolean check = fdao.isLike(mem_num, fa_num);
		request.setAttribute("check", check);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/fan_detailPage.jsp");
		
		return forward;
	}

}
