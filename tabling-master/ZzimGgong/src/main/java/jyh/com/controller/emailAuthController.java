package jyh.com.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class emailAuthController
 */
@WebServlet("/emailAuthController")
public class emailAuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		// 메일 설정
		System.out.println(email);
		System.out.println(email);
		System.out.println(email);
		String host="smtp.naver.com";
        String user="wjsdbsghks96@naver.com"; //자신의 네이버 계정
        String password="V2EYC8P7TL7T";//자신의 네이버 패스워드
        String to_email = email; // 받을 주소임. 
        System.out.println(to_email);
        //smtp 연결
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
     
        //인증번호 
        StringBuffer temp = new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++) {
        	int rIdx = rnd.nextInt(3);
        	switch(rIdx) {
        	case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        //인증키임 
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        //이메일 전송 
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.setFrom(new InternetAddress(user, "찜꽁관리자"));
            msg.addRecipient(Message.RecipientType.TO,new InternetAddress(to_email));
           
            //메일 제목
            msg.setSubject("[ZzimGgong]비밀번호 이메일 인증코드 발송");
            //메일 내용
            msg.setText("안녕하세요. 찜꽁입니다. 인증 번호는 "+AuthenticationKey+"입니다.");
            
            Transport.send(msg);
            System.out.println("이메일 전송");
            
        }catch (Exception e) {
            e.printStackTrace();// TODO: handle exception
        }
        
        //자꾸null 떠서 세션으로 넘겨줄거임. 
        HttpSession saveKey = request.getSession();
		saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
		request.setAttribute("email", email);
	  
		request.getRequestDispatcher("/jyh/views/authEmail.jsp").forward(request, response);
        
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
