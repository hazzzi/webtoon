package net.webtoon.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.WebtoonBoardBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonListReview implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		WebtoonDAO wdao = new WebtoonDAO();
		HttpSession session = request.getSession();
		String mem_num = (String)session.getAttribute("mem_num");
		//System.out.println("웹툰번호 : "+request.getParameter("num"));
		List<WebtoonBoardBean> webtoonBoardList = wdao.getReview(Integer.parseInt(request.getParameter("num")));
		request.setAttribute("webtoonBoardList", webtoonBoardList);
		
		List<Integer> check= wdao.isCommLike(mem_num);
		request.setAttribute("check", check);
		
		if(webtoonBoardList.isEmpty()==false){
			List<MemberBean> wbbimg = new ArrayList<MemberBean>();
			MemberDAO mdao = new MemberDAO();
			for(WebtoonBoardBean bb:webtoonBoardList){
				MemberBean mb = mdao.getMemberImg(bb.getWbb_mem_num());
				wbbimg.add(mb);
				System.out.println(mb.getProfileimg());
			}
			request.setAttribute("wbbimg", wbbimg);
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./recommend/rec_comments.jsp");
		return forward;
	}

}
