package app.book.dao;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionTo;

public class NewBookFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp); 
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req,resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String requestURI = req.getRequestURI();		// ??????/user/UserJoin.us
		String contextPath = req.getContextPath();		// ??????
		String command = requestURI.substring(contextPath.length());//	/user/UserJoin.us
		ActionTo transfer = null;
		
		switch(command) {
		//새 책 등록
		case "/book/NewBookAddOk.nb":
			try {
				transfer = new NewBookAddOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewBookAddOk"+ e);
			}
			break;
		//새 책 수정
		case "/book/NewBookEditOk.nb":
			try {
				transfer = new NewBookEditOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewBookEditOk"+e);
			}
			break;
		//수정하기 눌렀을때 데이터 받아오기
		case "/book/NewBookEdit.nb":
			try {
				transfer = new NewBookEditAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewBookEdit"+e);
			}
			break;
		}
		
		
		if(transfer != null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
		}
		else {
			RequestDispatcher disp = req.getRequestDispatcher(transfer.getPath());
				disp.forward(req, resp);
		}
	}
}
}
