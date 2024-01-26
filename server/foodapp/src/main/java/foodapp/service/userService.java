package foodapp.service;

import foodapp.entity.user;

public interface userService {
	boolean existsByEmail(String email);
	
	String saveUser(user user);
	

}
