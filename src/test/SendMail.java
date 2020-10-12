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

@WebServlet("/SendMail.do")
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String host = "smtp.gmail.com"; // naver 일 경우는 smtp.naver.com
		final String id =  "dlsgur2323@gmail.com"; // 보내는 사람 메일
		final String password = "vvtvmpilolqbmwtj";	// 메일 비밀번호
		
		// 받는 사람 주소
		String to = "19980622.dday@gmail.com"; // 받는 사람 메일
		
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
			message.setSubject("테스트제목123"); // 메일 제목
			   
			// 내용입력
			message.setText("테스트 메일입니다. ㅎ2");	// 메일 내용

			// 메일보내기 성공했으면
			Transport.send(message);
			System.out.println("message sent successfully...");

			} catch (MessagingException e) {
			  e.printStackTrace();
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
