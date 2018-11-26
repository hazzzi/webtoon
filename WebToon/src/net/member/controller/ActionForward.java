package net.member.controller;

public class ActionForward {
	//1.이동방식 true/false
		private boolean redirect;

		//2.이동경로
		private String path;

		public boolean isRedirect() {
			return redirect;
		}

		public void setRedirect(boolean redirect) {
			this.redirect = redirect;
		}

		public String getPath() {
			return path;
		}

		public void setPath(String path) {
			this.path = path;
		}
}
