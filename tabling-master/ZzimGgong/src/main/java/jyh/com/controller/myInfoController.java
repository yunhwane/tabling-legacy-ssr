package jyh.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jyh.model.memberDAO;
import jyh.model.memberDTO;

/**
 * Servlet implementation class myInfoController
 */
@WebServlet("/myInfoController")
public class myInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//로그인 된 값은 세션 객체의 멤버 객체이기때문에 가져와줌. 
		HttpSession session = request.getSession();
		memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
		String loginUserEmail = loginUser.getEmail();
		
		memberDAO mem = new memberDAO();
		memberDTO memInfo = (memberDTO)mem.selectUser(loginUserEmail);
		String page = null;
		//유효성 체크 
		if(memInfo != null) {
			page = "/jyh/views/myInfo.jsp";
			request.setAttribute("memInfo", memInfo);
		}else {
			page = "/jyh/views/error.jsp";
			request.setAttribute("msg","회원조회 실패.");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
