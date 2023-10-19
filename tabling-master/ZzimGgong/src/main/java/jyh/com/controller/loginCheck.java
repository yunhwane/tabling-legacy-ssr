package jyh.com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jyh.model.memberDAO;


/**
 * Servlet implementation class loginCheck
 */
@WebServlet("/loginCheck")
public class loginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pws = request.getParameter("pws");
		memberDAO mem = new memberDAO();
		int result = mem.loginCheck(email, pws);
		
		if(result==1) {
			//세션 처리 하기위하여 로그인 성공하면 세션처리로 이동 
			request.setAttribute("email",email);
			request.getRequestDispatcher("/makeSession").forward(request, response);
			return;
		}else if(result ==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('이메일과 비밀번호를 확인하세요.'); location.href='/jyh/views/login.jsp';</script>"); 
			//close하면 sendRedirect 불가 
			writer.close();
			return;
		}else if(result == (-1)){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('이메일과 비밀번호가 없습니다.'); location.href='/jyh/views/login.jsp';</script>"); 
			//close하면 sendRedirect 불가 
			writer.close();
			return;
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('sns 연동계정입니다.'); location.href='/jyh/views/login.jsp';</script>"); 
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
