package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.comm.db.CommentDAO;

public class BoardList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("boardList execute()");

		request.setCharacterEncoding("utf-8");

		BoardDAO bdao = new BoardDAO();

		int count = bdao.getBoardCount();
		int pageSize = 15;
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		List<BoardBean> boardList = null;
		if (count != 0) {
			boardList = bdao.getBoardList(startRow, pageSize);
		}

		int pageCount = (count % pageSize == 0) ? count / pageSize : count / pageSize + 1;
		int pageBlock = 10;
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;

		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardList", boardList);

		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		CommentDAO cdao = new CommentDAO();
		List commentcount = cdao.getCommentCount(boardList);
		request.setAttribute("commentcount", commentcount);
		// 댓글 게시판별 카운트

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/bd_main.jsp");

		return forward;
	}

}
