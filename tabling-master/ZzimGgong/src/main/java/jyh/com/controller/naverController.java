package jyh.com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class naverController
 */
@WebServlet("/naverController")
public class naverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 변수를 받아옴. 
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String email= request.getParameter("email");
		String nik = request.getParameter("nik");
		System.out.println(id);
		System.out.println(email);
		System.out.println(nik);
		request.setAttribute("id",id);
		request.setAttribute("email",email);
		request.setAttribute("nik",nik);
		
		request.getRequestDispatcher("/naverInsertService").forward(request, response);
		
	}
}
