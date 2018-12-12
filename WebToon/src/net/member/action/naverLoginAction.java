package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.controller.Action;
import net.member.controller.ActionForward;
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
		
		MemberDAO mdao = new MemberDAO();
		
		Boolean flag=mdao.memberIdCheck(uniqId);	
			/*if(아이디가 존재한다면){
			 * 		로그인 실행
			 * }else if(아이디가 없다면){
			 * 		회원가입
			 * }*/
			if(flag){//아이디 존재해서 바로 로그인
				
			}else{//데이터베이스에 정보 입력후에 로그인
				
			}
		
		
		return null;
	}
	

}
