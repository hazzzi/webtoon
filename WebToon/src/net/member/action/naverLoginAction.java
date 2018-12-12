package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import net.member.controller.Action;
import net.member.controller.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class naverLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println("naverLoginAction execute");
		String gender=(String)request.getParameter("gender");
		//String id=(String)request.getParameter("id"); uniqId 와 동일
		String email=(String)request.getParameter("email");
		String nik=(String)request.getParameter("nik");
		String profileImage=(String)request.getParameter("profileImage");
		String uniqId=(String)request.getParameter("uniqId");
		String ages=(String)request.getParameter("ages");
		//넘버,성별,닉네임은 넘버로 대체, 사진, 연령대, 이메일
		//날짜는 자동으로 
		//임의로 넣어야할것- 비번힌트 비번 비번질문 
		//M 이면 남    F면 여로     수정.   연령은 앞에 두글자만+'대'
		//이메일 닉네임 유니크아이디 프로필사진은 그대로 사용.
		//유니크 아이디 체크해서 첫로그인이면 DB에 인설트 :  로그인.   
		
		if(gender.equals("M")){
			gender="남";
		}else if(gender.equals("F")){
			gender="여";
		}
		ages=ages.substring(0,2)+"대";
		
		
		System.out.println(gender+","+email+","+nik+","+ profileImage+","+ uniqId+","+ ages);
		
		ActionForward forward = new ActionForward();
		
		MemberDAO mdao = new MemberDAO();
		MemberBean nmb = new MemberBean();
		//DB에 넣어야 한다면 이걸 넣어줄 거임.
		nmb.setAges(ages);
		nmb.setEmail(email);
		nmb.setGender(gender);
		nmb.setNik(nik);
		nmb.setProfileimg(profileImage);
		nmb.setNum(uniqId);
		nmb.setId(uniqId);
		nmb.setHint("나의 보물 제1호는?");
		nmb.setHintans(" ");
		nmb.setPass("  ");
		//db에 이미 정보가 있는지 체크
		Boolean flag=mdao.memberIdCheck(uniqId);	
			/*if(아이디가 존재한다면){
			 * 		로그인 실행
			 * }else if(아이디가 없다면){
			 * 		회원가입
			 * }*/
		
		//가상주소로 값 넘기려고 임시방편으로 세션에 멤버빈을 넣었습니다.
		//정보를 사용하고 해당 세션을 삭세해야합니다.
		HttpSession session = request.getSession();
		session.setAttribute("nmb", nmb);
		
			if(flag){//아이디 존재해서 바로 로그인 액션
				//DB에 있는 유니크 아이디(mem_num)와 닉네임을 세션값으로 생성해줘야함.
				//DB 셀렉트 호출필요.
				forward.setRedirect(true);
				forward.setPath("./naverLoginAction2.me");
				
				
			}else{//데이터베이스에 정보 입력후에 로그인  액션
				//nmb와 기타 값들을 입력시켜서 디비에 저장시켜야함.
				//리퀘스트값 전달 위해서 jsp페이지 거쳐 가기.
				
				forward.setRedirect(true);
				forward.setPath("./naverinsertAction.me");
			}
		
		
		return forward;
	}
	

}
