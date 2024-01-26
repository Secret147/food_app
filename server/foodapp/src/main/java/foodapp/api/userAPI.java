package foodapp.api;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import foodapp.dto.JwtResponse;
import foodapp.dto.userDTO;
import foodapp.entity.role;
import foodapp.entity.user;
import foodapp.model.roleName;
import foodapp.respository.roleRepo;
import foodapp.respository.userRepo;
import foodapp.security.jwt.JwtProvider;
import foodapp.security.userprinciple.userPrinciple;
import foodapp.service.userService;


@RestController
@CrossOrigin
@RequestMapping("/user")
public class userAPI {
	@Autowired
	private userRepo userRe;
	
	@Autowired
	private roleRepo roleRe;
	
	@Autowired
	private userService userSe;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	AuthenticationManager authenticationManager;
	
	@Autowired
	JwtProvider jwtProvider;
	
	@PostMapping("/newuser")
	public ResponseEntity<?> add(@RequestBody userDTO userDTO){
		if(userSe.existsByEmail(userDTO.getEmail())) {
			return ResponseEntity.badRequest().body("Email đã tồn tại!");
		}
		if(userDTO.getImage() ==null ||userDTO.getImage().trim().isEmpty()) {
			userDTO.setImage("https://i.pinimg.com/564x/7c/4e/79/7c4e791a1941af7d16ad0a1e27385bea.jpg");
		}
		user newuser = new user(userDTO.getName(),
				userDTO.getPhone(),
				userDTO.getAddress(),
				userDTO.getDescription(),
				userDTO.getEmail(),
				userDTO.getImage(),
				userDTO.getBirth(),
				passwordEncoder.encode(userDTO.getPassword()));
		
		Set<String> roleList = userDTO.getRoles();
		Set<role> roles = new HashSet<>();
		roleList.forEach(rolep -> {
			switch (rolep) {
			case "admin":
				role adminrole = roleRe.findByName(roleName.ADMIN).orElseThrow(() -> new RuntimeException("role not found1"));
				roles.add(adminrole);
				break;
			case "pm":
				role pmrole = roleRe.findByName(roleName.PM).orElseThrow(() -> new RuntimeException("role not found2"));
				roles.add(pmrole);
				break;

			default:
				role userrole = roleRe.findByName(roleName.USER).orElseThrow(() -> new RuntimeException("role not found3"));
				roles.add(userrole);
				break;
			}
		});
		
		newuser.setRoles(roles);
		userSe.saveUser(newuser);
		return ResponseEntity.ok("Tạo tài khoản thành công");
	}
	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody userDTO userDTO){
		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(userDTO.getEmail(), userDTO.getPassword()));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		String token = jwtProvider.createToken(authentication);
		userPrinciple userPrinciple = (userPrinciple) authentication.getPrincipal();
		return ResponseEntity.ok(new JwtResponse(token, userPrinciple.getEmail(), userPrinciple.getImage(), userPrinciple.getAuthorities()));
	}

}
