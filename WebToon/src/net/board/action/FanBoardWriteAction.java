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
import net.board.db.FanBean;
import net.board.db.FanDAO;

//a
public class FanBoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("fanBoardWriteAction execute()");

		request.setCharacterEncoding("UTF-8");

		ServletContext context = request.getServletContext();

		int maxSize = 5 * 1024 * 1024;
		String filePath = context.getRealPath("./upload");
		System.out.println(filePath);
		MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		FanBean fb = new FanBean();
		HttpSession session = request.getSession();
		String mem_num = (String) session.getAttribute("mem_num");
		ActionForward forward = new ActionForward();

		String fa_subject = multi.getParameter("fa_subject");
		String fa_category1 = multi.getParameter("fa_category1");
		String fa_category2 = multi.getParameter("fa_category2");
		String fa_content = multi.getParameter("fa_content");
		String fa_img = multi.getFilesystemName("fa_img");

		if (mem_num == null) {

			forward.setRedirect(true);
			forward.setPath("./login.me");

			return forward;

		} else if (fa_img == null) {
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
			forward.setPath("./fanboardList.fo");
			forward.setRedirect(true);

			fb.setFa_mem_num(mem_num);
			fb.setFa_category1(fa_category1);
			fb.setFa_category2(fa_category2);
			fb.setFa_subject(fa_subject);
			fb.setFa_content(fa_content);
			fb.setFa_img(fa_img);

			FanDAO fdao = new FanDAO();

			fdao.insertFan(fb);
		}

		return forward;

	}

}
