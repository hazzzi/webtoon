package net.board.action;

import java.io.PrintWriter;

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

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BoardModifyAction execute()");
		request.setCharacterEncoding("utf-8");

		ServletContext context = request.getServletContext();

		int maxSize = 5 * 1024 * 1024;
		String filePath = context.getRealPath("./upload");
		MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		int fb_num = Integer.parseInt(request.getParameter("fb_num"));
		String pageNum = request.getParameter("pageNum");

		BoardBean bd = new BoardBean();
		BoardDAO bdao = new BoardDAO();

		String fb_category = multi.getParameter("fb_category");
		String fb_subject = multi.getParameter("fb_subject");
		String fb_content = multi.getParameter("fb_content");
		String fb_img = multi.getFilesystemName("fb_img");

		if(fb_img==null){
			fb_img = multi.getParameter("fb_img1");
		}
		
		bd.setFb_category(fb_category);
		bd.setFb_subject(fb_subject);
		bd.setFb_img(fb_img);
		bd.setFb_content(fb_content);
		bd.setFb_num(fb_num);

		bdao.updateBoard(bd);
				
		ActionForward forward = new ActionForward();
		forward.setPath("./boardContent.bo?fb_num=" + fb_num + "&pageNum=" + pageNum);
		forward.setRedirect(true);

		return forward;
	}

}
