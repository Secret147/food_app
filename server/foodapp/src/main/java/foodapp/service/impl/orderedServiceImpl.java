package foodapp.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodapp.entity.ordered;
import foodapp.entity.user;
import foodapp.respository.orderedRepo;
import foodapp.respository.userRepo;
import foodapp.security.jwt.JwtProvider;
import foodapp.service.orderedService;

@Service
public class orderedServiceImpl implements orderedService{
	@Autowired
	private orderedRepo orderedRe;
	
	@Autowired
	private userRepo  userRe;
	
	@Autowired
	private JwtProvider provider;

	public orderedServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<ordered> findOrderByToken(String token) {
		String email = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(email).orElseThrow();
		List<ordered> orders = orderedRe.findAllByUserId(user.getId());
		return orders;
	}

}
