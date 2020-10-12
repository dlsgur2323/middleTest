package test;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mail {

	public static void main(String[] args) {
		String host = "smtp.gmail.com";
		final String id =  "dlsgur2323@gmail.com";
		final String password = "vvtvmpilolqbmwtj";
		
		// 받는 사람 주소
		String to = "dlsgur2323@naver.com";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
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
			message.setSubject("테스트제목123");
			   
			// 내용입력
			message.setText("테스트 메일입니다.");

			// 메일보내기 성공했으면
			Transport.send(message);
			System.out.println("message sent successfully...");

			} catch (MessagingException e) {
			  e.printStackTrace();
			}
	}

}
