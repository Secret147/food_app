package foodapp.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import foodapp.dto.billDTO;
import foodapp.security.jwt.JwtProvider;
import foodapp.security.jwt.JwtTokenFilter;
import foodapp.service.billService;

@RestController
@CrossOrigin
@RequestMapping("/bill")
public class billAPI {
	@Autowired
	private billService billSe;
	
	@Autowired
	private JwtTokenFilter jwtFilter;
	
	@PostMapping("/newbill")
    public ResponseEntity<?> newBill(HttpServletRequest request, @RequestBody billDTO bill){
		String token = jwtFilter.getJwt(request);
		if(token!=null) {
			billSe.saveBill(token, bill);
			return ResponseEntity.ok("Create bill successfull");
		}
		else {
			return ResponseEntity.badRequest().body("Create bill fail");
		}
		
	}
	
	@GetMapping("/listbill")
	public ResponseEntity<?> getListBill(HttpServletRequest request){
		String token = jwtFilter.getJwt(request);
		if(token!=null) {
			return ResponseEntity.ok(billSe.getListBill(token));
		}else {
			return ResponseEntity.badRequest().body("Not found bill");
		}
	}
	
	public billAPI() {
		// TODO Auto-generated constructor stub
	}

}
