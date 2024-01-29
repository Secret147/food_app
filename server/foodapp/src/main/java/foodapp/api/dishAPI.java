package foodapp.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import foodapp.entity.dish;
import foodapp.respository.dishRepo;
import foodapp.service.dishService;

@RestController
@CrossOrigin
@RequestMapping("/dish")
public class dishAPI {
	@Autowired
	private dishService dishSe;
	
	@GetMapping("/popular")
	public  ResponseEntity<?> getDishPopular(){
		if(dishSe.findPopualar()!=null) {
			return ResponseEntity.ok(dishSe.findPopualar());
		}
		else {
			return ResponseEntity.badRequest().body("Không có sản phẩm phổ biến");
		}
		
	}
	
	@GetMapping("/type/{type}")
	public  ResponseEntity<?> getDishByType(@PathVariable String type){
		if(dishSe.findByType(type)!=null) {
		return ResponseEntity.ok(dishSe.findByType(type));
		}else {
			return ResponseEntity.badRequest().body("Không có sản phẩm loại này");
		}
	}
	
	

}
