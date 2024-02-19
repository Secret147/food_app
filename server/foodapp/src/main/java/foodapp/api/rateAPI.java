package foodapp.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import foodapp.dto.rateDTO;
import foodapp.entity.dish;
import foodapp.entity.rate;
import foodapp.security.jwt.JwtTokenFilter;
import foodapp.service.rateService;

@RestController
@CrossOrigin
@RequestMapping("/rate")
public class rateAPI {

	public rateAPI() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	private rateService rateSe;
	
	@Autowired
	JwtTokenFilter jwtFilter;
	
	@PostMapping("/newevalute")
	public ResponseEntity<?> newEvalute(@RequestBody rateDTO rate,HttpServletRequest request){
		String token = jwtFilter.getJwt(request);
		if(rate!=null) {
			rateSe.newEvalute(token, rate);
			return ResponseEntity.ok("Them danh gia thanh cong");
		}
		else {
			return ResponseEntity.badRequest().body("Them danh gia that bai");
		}
	}
	
	@GetMapping("/listreview/{id}")
	public ResponseEntity<?> listReview(@PathVariable Long id){
		if(id!=null) {
			return ResponseEntity.ok(rateSe.getListReview(id));
		}
		else {
			return ResponseEntity.badRequest().body("Fail to get list review");
		}
		
	}

}
