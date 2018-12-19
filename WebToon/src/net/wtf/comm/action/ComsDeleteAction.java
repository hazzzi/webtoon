package net.wtf.comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.wtf.comm.db.CommentsBean;
import net.wtf.comm.db.CommentsDAO;

public class ComsDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	System.out.println("ComsDeleteAction execute()");
	request.setCharacterEncoding("utf-8");

	
	int fa_num= Integer.parseInt(request.getParameter("fa_num"));
	System.out.println("ComsDeleteAction의 댓글 번호는  "+fa_num);
	
	CommentsBean cd = new CommentsBean();
	CommentsDAO cdao = new CommentsDAO();
	
	int wtf_num = Integer.parseInt(request.getParameter("wtf_num"));
	System.out.println(fa_num);
	cd.setWtf_fa_num(fa_num);
	cd.setWtf_num(wtf_num);
	
	cdao.deleteComment(cd);
	
	ActionForward forward = new ActionForward();
	forward.setPath("./fanboardContent.fo?wtf_num"+wtf_num+"&fa_num="+fa_num);
	forward.setRedirect(true);
	
	return forward;
	}
}