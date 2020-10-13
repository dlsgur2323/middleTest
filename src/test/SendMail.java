package test;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
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

@WebServlet("/SendMail.do")
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String host = "smtp.gmail.com"; // naver 일 경우는 smtp.naver.com
		final String id =  "dlsgur2323@gmail.com"; // 보내는 사람 메일
		final String password = "vvtvmpilolqbmwtj";	// 메일 비밀번호
		
		String email = request.getParameter("email");
		
		// 받는 사람 주소
		String to = email; // 받는 사람 메일
		
		Properties props = new Properties();	// 설정 건드릴 필요 X
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.user", id);
		props.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(id, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
		    message.setFrom(new InternetAddress(id));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// 제목입력
			message.setSubject("너갈너갈 이메일 인증"); // 메일 제목
			
			String auth = authnum(); // 인증번호 생성
			// 내용입력
			message.setText(auth);	// 메일 내용

			// 메일보내기 성공했으면
			Transport.send(message);
			
			HttpSession mSession = request.getSession();
			mSession.setAttribute("authnum", auth);
			request.getRequestDispatcher("sendMail.jsp").forward(request, response);
			
			} catch (MessagingException e) {
			  e.printStackTrace();
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	private String authnum() {
		String num = "";
		for(int i = 0; i < 6; i++) {
			num += (int)(Math.random() * 10);
		}
		return num;
	}
	
	
	
	
	
}
