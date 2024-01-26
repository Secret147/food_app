package foodapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodapp.entity.user;
import foodapp.respository.userRepo;
import foodapp.service.userService;

@Service
public class userServiceImpl implements userService {

	@Autowired
	private userRepo userRe;
	

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

}
