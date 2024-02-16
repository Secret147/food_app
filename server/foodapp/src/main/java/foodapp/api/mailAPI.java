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
import foodapp.service.mailService;

@RestController
@CrossOrigin
@RequestMapping("/mail")
public class mailAPI {

	@Autowired
	private mailService mailSe;
	
	@PostMapping("/send/{mail}")
	public ResponseEntity<?> sendMail(@PathVariable String mail, @RequestBody mailStructure mailStructure){
		mailSe.sendMail(mail, mailStructure);
		return ResponseEntity.ok("Successfully");
	}

}
