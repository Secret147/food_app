package foodapp.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import foodapp.dto.orderedDTO;
import foodapp.entity.ordered;
import foodapp.respository.orderedRepo;
import foodapp.security.jwt.JwtProvider;
import foodapp.security.jwt.JwtTokenFilter;
import foodapp.service.orderedService;

@RestController
@CrossOrigin
@RequestMapping("/cart")
public class orderedAPI {
	
	@Autowired
	private JwtTokenFilter jwtFilter;
	
	@Autowired
	private JwtProvider jwtProvider;
	
	@Autowired
	private orderedRepo orderRe;
	
	@Autowired
	private orderedService orderSe;

	@GetMapping("/ordered")
	public ResponseEntity<?> getOrderItem(HttpServletRequest request){
		String token = jwtFilter.getJwt(request);
		if(token!=null) {
		return ResponseEntity.ok(orderSe.findOrderByToken(token));
		}else {
			return ResponseEntity.badRequest().body("Phiên đăng nhập đã hết hạn");
		}
		
	}
	
	@PostMapping("/neworder")
	public ResponseEntity<?> newOrderItem(@RequestBody orderedDTO order,HttpServletRequest request){
		String token = jwtFilter.getJwt(request);
		if(order !=null) {
		    
			orderSe.newOrder(order, token);
			return ResponseEntity.ok("add order success");
			
		}
		else {
			return ResponseEntity.badRequest().body("add fail");
		}
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOrder(@PathVariable Long id,HttpServletRequest request){
		String token = jwtFilter.getJwt(request);
		if(id!=null) {
			orderSe.deleteOrdered(token, id);
			return ResponseEntity.ok("delete success");
		}
		else {
			return ResponseEntity.badRequest().body("Khong tim thay order id");
		}
		
	}
	
	@GetMapping("/all")
	public ResponseEntity<?> getAllOrderItem(){
		return ResponseEntity.ok(orderRe.findAll());
	}
	
	@PutMapping("/add/quantity")
	public ResponseEntity<?> addQuantity(@RequestBody ordered order,HttpServletRequest request){
		String token = jwtFilter.getJwt(request);
		if(order!=null) {
			orderSe.addQuantity(order, token);
			return ResponseEntity.ok("add successful");
		}
		else {
			return ResponseEntity.badRequest().body("add quantity fail");
		}
	}
	
	@PutMapping("/remove/quantity")
	public ResponseEntity<?> removeQuantity(@RequestBody ordered order,HttpServletRequest request){
		String token = jwtFilter.getJwt(request);
		if(order!=null) {
			orderSe.removeQuantity(order, token);
			return ResponseEntity.ok("add successful");
		}
		else {
			return ResponseEntity.badRequest().body("add quantity fail");
		}
	}

}
