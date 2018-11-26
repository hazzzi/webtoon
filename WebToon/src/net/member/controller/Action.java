package net.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.ActionForward;

public interface Action  {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
