import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Demo {

	public static void main(String[] args) {
		Properties p = new Properties();
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", 587);
		
		Session s = Session.getInstance(p,
				 new javax.mail.Authenticator() {
				 protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication("taidoctor1995@gmail.com", "tai12345678");
				 }
				});
		
		Message msg = new MimeMessage(s);
		try {
			msg.setFrom(new InternetAddress("taidoctor1995@gmail.com"));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("laptrinhvien1995@gmail.com"));
			msg.setSubject("Hãy để chúng tôi chích bạn!");
			msg.setText("Đã đến ngày chích. Nếu bạn quên thì kệ mẹ bạn.");
			
			Transport.send(msg);
			System.out.println("done");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
