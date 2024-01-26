package foodapp.security.userprinciple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import foodapp.respository.userRepo;
import foodapp.entity.user;

@Service
public class userDetailService implements UserDetailsService{

	@Autowired
	userRepo userRe;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		user user = userRe.findByEmail(username).orElseThrow(() -> new UsernameNotFoundException("failinuserdetailservice"));
		return userPrinciple.build(user);
	}
	
	

}
