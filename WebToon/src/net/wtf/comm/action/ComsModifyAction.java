package net.wtf.comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.wtf.comm.db.CommentsBean;
import net.wtf.comm.db.CommentsDAO;

public class ComsModifyAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ComsModifyAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int fa_num = Integer.parseInt(request.getParameter("fa_num"));
		int wtf_num = Integer.parseInt(request.getParameter("wtf_num"));
		System.out.println("ComsModifyAction의 댓글 번호는  "+wtf_num);
		
		CommentsBean cb = new CommentsBean();
		CommentsDAO cdao = new CommentsDAO();
		
		String wtf_content = request.getParameter("new_content");
		System.out.println("수정할 댓글 내용 : "+ wtf_content);
		cb.setWtf_content(wtf_content);
		cb.setWtf_fa_num(fa_num);
		cb.setWtf_num(wtf_num);
		
		cdao.updateComment(cb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./fanboardContent.fo?wtf_num="+ wtf_num+"&fa_num="+fa_num);
		forward.setRedirect(true);
		return forward;
	}
}
