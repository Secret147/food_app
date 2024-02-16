package foodapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import foodapp.model.mailStructure;
import foodapp.service.mailService;

@Service
public class mailServiceImpl implements mailService {

	public mailServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	private JavaMailSender mailSender;

	
	@Value("${spring.mail.username}")
	private String fromMail;
	
	@Override
	public void sendMail(String mail, mailStructure mailStructure) {
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom(fromMail);
		simpleMailMessage.setSubject(mailStructure.getSubject());
		simpleMailMessage.setText(mailStructure.getMessage());
		simpleMailMessage.setTo(mail);
		
		mailSender.send(simpleMailMessage);
		
	
	}

}
