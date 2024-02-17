package foodapp.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import foodapp.model.mailStructure;
import foodapp.respository.userRepo;
import foodapp.service.mailService;

@RestController
@CrossOrigin
@RequestMapping("/mail")
public class mailAPI {

	@Autowired
	private mailService mailSe;
	
	@Autowired
	private userRepo userRe;
	
	@PostMapping("/send/{mail}")
	public ResponseEntity<?> sendMail(@PathVariable String mail, @RequestBody mailStructure mailStructure){
		mailSe.sendMail(mail, mailStructure);
		return ResponseEntity.ok("Successfully");
	}
	
	@PostMapping("/newpassword/{mail}")
	public ResponseEntity<?> sendMailPassword(@PathVariable String mail){
		
		if(userRe.existsByEmail(mail)) {
			mailSe.sendPassword(mail);
			return ResponseEntity.ok("Success");
		}
		else {
			return ResponseEntity.badRequest().body("Email chua duoc dang ki tai khoan");
		}
		
	}

}
