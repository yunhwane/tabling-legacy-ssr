package jyh.com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jyh.model.memberDAO;
import jyh.model.memberDTO;
/**
 * Servlet implementation class snsInsertService
 */
@WebServlet("/kakaoInsertService")
public class kakaoInsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String nik = request.getParameter("nik");
		memberDAO mem = new memberDAO();
		
		// 등록 결과 
		int result = mem.kakaoSignUp(new memberDTO(email,nik));
		if(result>0) {
			int token = mem.kakaoTokenInsert(email,id);
			if(token > 0) {
				//성공시 세션처리 
				request.setAttribute("email",email);
				request.getRequestDispatcher("/makeSession").forward(request, response);
				return;
			}else {
				// 카카오에서 넘어오는 db 문제이므로 회원등록은 됨			
				request.getRequestDispatcher("/makeSession").forward(request, response);
				return;
			}
		}else {
			// 이메일 동의를 하지 않은 경우. 
			request.setAttribute("error","SNS 인증 동의 확인 후 \n 다시 한번 로그인해주세요.");
			request.getRequestDispatcher("/jyh/views/login.jsp").forward(request, response);
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
