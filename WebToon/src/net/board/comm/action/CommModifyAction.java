package net.board.comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.comm.db.CommentBean;
import net.comm.db.CommentDAO;

public class CommModifyAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("CommModifyAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		int fbcom_bdnum = Integer.parseInt(request.getParameter("fbcom_bdnum"));
		System.out.println("CommModifyAction의 댓글 번호는  "+fbcom_bdnum);
		
		CommentBean cb = new CommentBean();
		CommentDAO cdao = new CommentDAO();
		
		String fbcom_content = request.getParameter("new_content");
		System.out.println("수정할 댓글 내용 : "+ fbcom_content);
		cb.setFbcom_content(fbcom_content);
		cb.setFbcom_fb_num(fb_num);
		cb.setFbcom_bdnum(fbcom_bdnum);
		
		cdao.updateComment(cb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./boardContent.bo?fbcom_bdnum="+ fbcom_bdnum+"&fb_num="+fb_num);
		forward.setRedirect(true);
		return forward;
	}
}
