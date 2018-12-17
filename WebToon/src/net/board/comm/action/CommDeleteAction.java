package net.board.comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.comm.db.CommentBean;
import net.comm.db.CommentDAO;

public class CommDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	System.out.println("BoardDeleteAction execute()");
	request.setCharacterEncoding("utf-8");

	
	int fbcom_bdnum = Integer.parseInt(request.getParameter("fbcom_bdnum"));
	System.out.println("CommDeleteAction의 댓글 번호는  "+fbcom_bdnum);
	
	CommentBean cd = new CommentBean();
	CommentDAO cdao = new CommentDAO();
	
	int fb_num = Integer.parseInt(request.getParameter("fb_num"));
	System.out.println(fb_num);
	cd.setFbcom_fb_num(fb_num);
	cd.setFbcom_bdnum(fbcom_bdnum);
	
	cdao.deleteComment(cd);
	
	ActionForward forward = new ActionForward();
	forward.setPath("./boardContent.bo?fbcom_bdnum"+fbcom_bdnum+"&fb_num="+fb_num);
	forward.setRedirect(true);
	
	return forward;
	}
}