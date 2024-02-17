package foodapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.Random;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import foodapp.entity.user;
import foodapp.model.mailStructure;
import foodapp.respository.userRepo;
import foodapp.service.mailService;

@Service
public class mailServiceImpl implements mailService {

	public mailServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private userRepo userRe;

	
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

	@Override
	public void sendPassword(String mail) {
		user user = userRe.findByEmail(mail).orElseThrow();
		
		
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(8);

        for (int i = 0; i < 8; i++) {
            sb.append(characters.charAt(rnd.nextInt(characters.length())));
        }
        BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();

        String password = sb.toString();
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom(fromMail);
		simpleMailMessage.setSubject("Mật khẩu mới của bạn cho foodapp");
		simpleMailMessage.setText(password);
		simpleMailMessage.setTo(mail);
		user.setPassword(bcryptPasswordEncoder.encode(password));
		userRe.save(user);
		mailSender.send(simpleMailMessage);
		
	}

}
