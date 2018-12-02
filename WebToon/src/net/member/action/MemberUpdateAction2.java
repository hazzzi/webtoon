package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberUpdateAction2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberUpdateAction2 execute ");
		request.setCharacterEncoding("utf-8");
		String filePath = request.getRealPath("/upload");
		System.out.println("파일 패스: "+filePath);
		int maxSize=5*1024*1024;//5M
		// MultipartRequest multi 객체생성
		MultipartRequest multi=
				new MultipartRequest(request, filePath, maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		MemberBean mb = new MemberBean();
		mb.setProgileimg(multi.getFilesystemName("file"));
		mb.setId(multi.getParameter("id"));
		mb.setNik(multi.getParameter("nikname"));
		mb.setEmail(multi.getParameter("email"));
		mb.setHint(multi.getParameter("sel_hint"));
		mb.setHintans(multi.getParameter("hint_ans"));
		mb.setAges(multi.getParameter("sel_age"));
		System.out.println("파일 스트링 확인 "+multi.getFilesystemName("profileImg"));
		MemberDAO mdao = new MemberDAO();
		mdao.updateMember(mb);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./myProfile.me");
		
		return forward;
	}
	
}
