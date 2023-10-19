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
 * Servlet implementation class myInfoUpdate
 */
@WebServlet("/myInfoUpdate")
public class myInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myInfoUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String nickname = request.getParameter("nik");
		String pnum = request.getParameter("pum");
		String addr = request.getParameter("addr");
		//상세 주소 
		String daddr = request.getParameter("detailaddr");
		//문자열 결합 
		StringBuilder sb = new StringBuilder();
		sb.append(addr);
		sb.append(" ");
		sb.append(daddr);
		String address = new String(sb);
		
		memberDAO mem = new memberDAO();
		int a = mem.upDateUser(nickname, pnum, address, email);
		if(a>0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('회원 수정이 완료되었습니다.'); location.href='/myInfoController';</script>");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('회원 수정을 실패하였습니다.'); location.href='/jyh/views/myInfo.jsp';</script>");
		}
		
	}

}
