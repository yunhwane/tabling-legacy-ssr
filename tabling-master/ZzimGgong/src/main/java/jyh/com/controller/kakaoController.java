package jyh.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class snsController
 */
@WebServlet("/kakaoController")
public class kakaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 변수를 받아옴. 
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String email= request.getParameter("email");
		String nik = request.getParameter("nik");
		
		request.setAttribute("id",id);
		request.setAttribute("email",email);
		request.setAttribute("nik",nik);
		
		request.getRequestDispatcher("/kakaoInsertService").forward(request, response);
		
	}

}
