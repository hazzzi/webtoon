package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberUpdateAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberUpdateAction2 execute ");
		request.setCharacterEncoding("utf-8");
		String filePath = request.getRealPath("/upload");
		System.out.println("파일 패스: " + filePath);
		int maxSize = 5 * 1024 * 1024;// 5M
		// MultipartRequest multi 객체생성
		MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());
		HttpSession session = request.getSession();
		String mem_num = (String) session.getAttribute("mem_num");
		MemberBean mb = new MemberBean();
		mb.setNum(mem_num);
		mb.setProfileimg(multi.getFilesystemName("file"));
		mb.setId(multi.getParameter("id"));
		mb.setNik(multi.getParameter("nikname"));
		mb.setEmail(multi.getParameter("email"));
		mb.setHint(multi.getParameter("sel_hint"));
		mb.setHintans(multi.getParameter("hint_ans"));
		mb.setAges(multi.getParameter("sel_age"));
		System.out.println("파일 스트링 확인 " + filePath + multi.getFilesystemName("file"));
		MemberDAO mdao = new MemberDAO();

		// mb2는 업데이트시에 기존 정보와 다를 경우에 닉네임과 이메일이 중복되면 안되기 때문에 그걸 체크하기 위해 만들었습니다
		MemberBean mb2 = mdao.getMember(mem_num);

		ActionForward forward = new ActionForward();

		/* 폼의 닉와 이메일이 디비와 다르면 디비에 중복체크를 실행해야한다. */
		if (!mb.getEmail().equals(mb2.getEmail())) {//이메일이 기존과 다를때 에는
			if (mdao.emailOverlapcheck(mb)) {//이메일이 다른 것과 중복되는지 체크해본다.
				forward.setRedirect(true);
				forward.setPath("./login.me");

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 있는 이메일입니다..');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}else {//이메일 닉이 그전과 같으면 그대로 업데이트
				if(mb.getProfileimg()==null){
				mb.setProfileimg(mb2.getProfileimg());}
				mdao.updateMember(mb);

				session.setAttribute("mem_nik", mb.getNik());

				forward.setRedirect(true);
				forward.setPath("./myProfile.me");
			}
		} else if (!mb.getNik().equals(mb2.getNik())) {
			if (mdao.nikOverlapcheck(mb)) {
				forward.setRedirect(true);
				forward.setPath("./login.me");

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 있는 닉네임입니다..');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}else {//이메일 닉이 그전과 같으면 그대로 업데이트
				if(mb.getProfileimg()==null){
					mb.setProfileimg(mb2.getProfileimg());}
				mdao.updateMember(mb);

				session.setAttribute("mem_nik", mb.getNik());

				forward.setRedirect(true);
				forward.setPath("./myProfile.me");
			}
		} else {//이메일 닉이 그전과 같으면 그대로 업데이트
			if(mb.getProfileimg()==null){
				mb.setProfileimg(mb2.getProfileimg());}
			mdao.updateMember(mb);

			session.setAttribute("mem_nik", mb.getNik());

			forward.setRedirect(true);
			forward.setPath("./myProfile.me");
		}

		

		return forward;
	}

}
