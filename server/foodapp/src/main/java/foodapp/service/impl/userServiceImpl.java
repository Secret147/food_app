package foodapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
