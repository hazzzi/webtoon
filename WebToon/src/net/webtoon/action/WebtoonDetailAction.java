package net.webtoon.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.FanBean;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.webtoon.controller.Action;
import net.webtoon.controller.ActionForward;
import net.webtoon.db.SearchDAO;
import net.webtoon.db.WebtoonBean;
import net.webtoon.db.WebtoonBoardBean;
import net.webtoon.db.WebtoonDAO;

public class WebtoonDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String num = request.getParameter("num");
		String mem_num = (String)session.getAttribute("mem_num");
		if(num!=null){
			int web_num = Integer.parseInt(num);
			
			WebtoonDAO wdao = new WebtoonDAO();
			SearchDAO sdao = new SearchDAO();
			MemberDAO mdao = new MemberDAO();
			// 기본적인 웹툰정보
			WebtoonBean wb = wdao.getWebtoon(web_num);
			
			// 웹툰 평균 평점
			double score = wdao.getMeanScore(web_num);
			
			// 웹툰 평가한 사람수
			int count = wdao.getCountRec(web_num);
			
			// 리뷰 좋아요 상위2명
			List<WebtoonBoardBean> wbb = wdao.getTop2Review(web_num);
			// 리뷰 작성 수
			int reviewcount = wdao.getReviewCount(web_num);
			
			// 팬아트 좋아요 상위2명
			List<FanBean> fanList = wdao.getTop2Fanart(web_num);
			
			// 평가한 사람이없을때 제어
			if(wbb.isEmpty()==false){
				List<MemberBean> wbbimg = new ArrayList<MemberBean>();
				for(WebtoonBoardBean bb:wbb){
					MemberBean mb = mdao.getMemberImg(bb.getWbb_mem_num());
					wbbimg.add(mb);
				}
				request.setAttribute("wbbimg", wbbimg);
			}
			List<Integer> check= wdao.isCommLike(mem_num);
			List<WebtoonBean> similar = sdao.getSimilarity(web_num);
			//System.out.println(similar.get(2).getWeb_subject());
			request.setAttribute("wb", wb);
			request.setAttribute("score", score);
			request.setAttribute("count", count);
			request.setAttribute("reviewcount", reviewcount);
			request.setAttribute("wbb", wbb);
			request.setAttribute("similar", similar);
			request.setAttribute("fanList", fanList);
			request.setAttribute("check", check);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./main/search-result.jsp");
			
			return forward;
		}else{
			response.setContentType("text/html; charset=UTF-8"); // jsp 상단의 contentType과 같게함
			PrintWriter out=response.getWriter(); // response의 권한을 받아오기
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
	}

}
