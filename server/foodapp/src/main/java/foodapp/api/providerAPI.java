package foodapp.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import foodapp.respository.providerRepo;

@RestController
@CrossOrigin
public class providerAPI {
	@Autowired
	providerRepo pvRe;

	@GetMapping("/provider")
	public ResponseEntity<?> getProvider(){
		return ResponseEntity.ok(pvRe.findAll());
	}

}
