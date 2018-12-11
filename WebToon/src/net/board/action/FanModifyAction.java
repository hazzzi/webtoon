package net.board.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanBean;
import net.board.db.FanDAO;

public class FanModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("FanModifyAction execute()");
		request.getParameter("utf-8");

		ServletContext context = request.getServletContext();

		int maxSize = 5 * 1024 * 1024;
		String filePath = context.getRealPath("./upload");
		MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		int fa_num = Integer.parseInt(request.getParameter("fa_num"));
		String pageNum = request.getParameter("pageNum");

		FanBean fb = new FanBean();
		FanDAO fdao = new FanDAO();
		ActionForward forward = new ActionForward();

		String fa_category1 = multi.getParameter("fa_category1");
		String fa_category2 = multi.getParameter("fa_category2");
		String fa_subject = multi.getParameter("fa_subject");
		String fa_content = multi.getParameter("fa_content");
		String fa_img = multi.getFilesystemName("fa_img");

		if (fa_img == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('사진 첨부는 필수 사항입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else if (fa_category1 == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('카테고리 선택은 필수 사항입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			fb.setFa_category1(fa_category1);
			fb.setFa_category2(fa_category2);
			fb.setFa_subject(fa_subject);
			fb.setFa_content(fa_content);
			fb.setFa_img(fa_img);

			fdao.updateFanBoard(fb);

			forward.setPath("./fanContent.bo?fa_num=" + fa_num + "&pageNum=" + pageNum);
			forward.setRedirect(true);

		}

		return forward;
	}

}
