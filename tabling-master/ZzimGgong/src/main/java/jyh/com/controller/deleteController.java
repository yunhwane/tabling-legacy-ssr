package jyh.com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jyh.model.memberDAO;
import jyh.model.memberDTO;

/**
 * Servlet implementation class deleteController
 */
@WebServlet("/deleteController")
public class deleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//세션 아이디 값 가져옴 
		HttpSession session = request.getSession();
		memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
		String loginUserEmail = loginUser.getEmail();
		// 입력한 이메일 값 가져옴 
		memberDAO mem = new memberDAO();
		// 세션값과 입력한 이메일 값이 같을 때 
		int value = mem.deleteAccount(loginUserEmail);
		
		if(value>0) {
			//세션 삭제하기.
			session.invalidate();
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('성공적으로 탈퇴되었습니다.'); location.href='/ljw/pg0000.jsp';</script>"); 
			//close하면 sendRedirect 불가 
			writer.close();
			return;
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('다시한번 탈퇴버튼을 눌러주세요'); location.href='/myInfoController';</script>"); 
			//close하면 sendRedirect 불가 
			writer.close();
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
