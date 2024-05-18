package foodapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import foodapp.dto.ResetPasswordDTO;
import foodapp.dto.userDTO;
import foodapp.entity.user;
import foodapp.respository.userRepo;
import foodapp.security.jwt.JwtProvider;
import foodapp.service.userService;

@Service
public class userServiceImpl implements userService {

	@Autowired
	private userRepo userRe;
	
	@Autowired
	private JwtProvider provider;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	

	@Override
	public boolean existsByEmail(String email) {
		if(userRe.existsByEmail(email)) {
			return true;
		}
		else {
			return false;
		}
	}


	@Override
	public String saveUser(user user) {
		userRe.save(user);
		return "Tạo tài khoản thành công";
	}


	@Override
	public user getUserByToken(String token) {
		String username = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(username).orElseThrow();
		return user;
	}


	@Override
	public void editUser(String token, userDTO userDTO) {
		// TODO Auto-generated method stub
		String username = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(username).orElseThrow();
		user.setName(userDTO.getName());
		user.setPhone(userDTO.getPhone());
		user.setAddress(userDTO.getAddress());
		user.setBirth(userDTO.getBirth());
		user.setImage(userDTO.getImage());
		user.setDescription(userDTO.getDescription());
		userRe.save(user);
		
		
	}


	@Override
	public boolean resetPassword(ResetPasswordDTO resetPasswordDTO) {
		user user = userRe.findById(resetPasswordDTO.getUserId()).orElseThrow();
		if(passwordEncoder.matches( resetPasswordDTO.getOldPassword(), user.getPassword())) {
			String newHashedPassword = passwordEncoder.encode(resetPasswordDTO.getNewPassword());
			user.setPassword(newHashedPassword);
			userRe.save(user);
			return true;
		}
		
		return false;
		
	}

}
