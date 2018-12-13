package net.board.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.FanDAO;

public class FanBoardCategoryAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		System.out.println("fanBoardcategory() execute()");
		
		request.setCharacterEncoding("utf-8");
		
		FanDAO fdao = new FanDAO();
		
		String fan_category = request.getParameter("fan_category");
		
		List <String> list = fdao.categoryFan(fan_category);
		
		
		//request.setAttribute("fan_category", fan_category);
		System.out.println(list);
		
		response.setContentType("text/html; charset=UTF-8");
 
		PrintWriter out=response.getWriter();

        out.println(String.join(",", list));
	
		return null;
	}

}
