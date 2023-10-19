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
 * Servlet implementation class checkEmail
 */
@WebServlet("/checkEmail")
public class checkEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String email = request.getParameter("email");
		
		memberDAO m = new memberDAO();
		String check = m.IdCheck(email);
		if(email.equals(null)||email.equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('이메일이 없습니다.'); location.href='/jyh/views/authkey.jsp';</script>"); 
			//close하면 sendRedirect 불가 
			writer.close();
			return;
		}else if(check.equals("no_auth")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('이메일이 없습니다.'); location.href='/jyh/views/authkey.jsp';</script>"); 
			//close하면 sendRedirect 불가 
			writer.close();
			return;
		}else if(check.equals("kakao_auth") || check.equals("naver_auth")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('SNS 연동계정입니다.'); location.href='/jyh/views/login.jsp';</script>"); 
			//close하면 sendRedirect 불가 
			writer.close();
			return;
		}else{
			request.setAttribute("email", email);
			request.getRequestDispatcher("/sendMail").forward(request, response);
		}
		
		
	}

}
