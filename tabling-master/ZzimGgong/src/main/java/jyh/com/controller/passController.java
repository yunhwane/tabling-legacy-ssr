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
 * Servlet implementation class passController
 */
@WebServlet("/passController")
public class passController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String newpass = request.getParameter("newPass");
		System.out.println(email);
		System.out.println(newpass);
		request.setAttribute("email", email);
		request.setAttribute("newpass", newpass);
		//유효성 체크 
		memberDAO mem = new memberDAO();
		if(newpass.equals("") || newpass.equals(null)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('비밀번호 작성이 이루어지지 않았습니다.'); location.href='/jyh/views/updatePass.jsp';</script>"); 
			//close하면 sendRedirect 불가 
			writer.close();
			return;
		} else {
			// 비번 업데이트
			int val = mem.passUpdate(newpass, email);
			if (val > 0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer1 = response.getWriter();
				writer1.print(
						"<script>alert('비밀번호 변경되었습니다!'); location.href='/myInfoController';</script>");
				writer1.close();
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer2 = response.getWriter();
				writer2.println(
						"<script>alert('비밀번호 변경이 실패하였습니다 다시한번 시도해주세요.'); location.href='/jyh/views/updatePass.jsp';</script>");
				writer2.close();
			}
		}
	}

}
