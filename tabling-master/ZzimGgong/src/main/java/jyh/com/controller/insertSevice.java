package jyh.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jyh.model.memberDAO;
import jyh.model.memberDTO;

/**
 * Servlet implementation class insertSevice
 */
@WebServlet("/member/insert")
public class insertSevice extends HttpServlet {
	private static final long serialVersionUID = 1L;
memberDTO member = new memberDTO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		//파라미터값 받기.
		String email = request.getParameter("email");
		String pw = request.getParameter("pws");
		String nik = request.getParameter("nik");
		String pnum = request.getParameter("pnum");
		System.out.println(pnum);
		System.out.println(email+pw+nik);
		//도로명 주소 
		String addr = request.getParameter("addr");
		//상세 주소 
		String daddr = request.getParameter("detailaddr");
		//문자열 결합 
		StringBuilder sb = new StringBuilder();
		sb.append(addr);
		sb.append(" ");
		sb.append(daddr);
		String address = new String(sb);
		// DB 넣기 
		memberDAO insert = new memberDAO();
		boolean idx = insert.SignUp(new memberDTO(email,pw,nik,pnum,address));
		System.out.println(idx);
		//회원가입 성공시 
		if(idx == true) {
			request.setAttribute("email", email);
			// 세션 처리후에 메인페이지 이동하기.
			System.out.println(email);
			request.getRequestDispatcher("/makeSession").forward(request, response);
			return;
		}else {
			request.setAttribute("joinResult","0");
			request.getRequestDispatcher("/jyh/views/insertMember.jsp").forward(request, response);
			return;
		}
	}
		
}
