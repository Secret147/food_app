package foodapp.service;

import foodapp.dto.ResetPasswordDTO;
import foodapp.dto.userDTO;
import foodapp.entity.user;

public interface userService {
	boolean existsByEmail(String email);
	
	String saveUser(user user);
	
	user getUserByToken(String token);
	
	void editUser(String token, userDTO userDTO);
	
	boolean resetPassword(ResetPasswordDTO resetPasswordDTO);
	

}
