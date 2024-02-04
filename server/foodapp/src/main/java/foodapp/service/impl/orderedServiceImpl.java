package foodapp.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodapp.dto.orderedDTO;
import foodapp.entity.dish;
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

	@Override
	public boolean newOrder(orderedDTO orderedDTO, String token) {
		ordered ordered = new ordered();
		String email = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(email).orElseThrow();
		ordered.setUser(user);
		ordered.setDish(orderedDTO.getDish());
		ordered.setQuantity(orderedDTO.getQuantity());
		orderedRe.save(ordered);
		return true;
	}

	@Override
	public boolean addQuantity(ordered order, String token) {
		String email = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(email).orElseThrow();
		order.setQuantity(order.getQuantity()+1);
		order.setUser(user);
		orderedRe.save(order);
		return true;
	}

	@Override
	public boolean removeQuantity(ordered order, String token) {
		if(order.getQuantity()>1) {
			String email = provider.getUserNameFromToken(token);
			user user = userRe.findByEmail(email).orElseThrow();
			order.setUser(user);
			order.setQuantity(order.getQuantity()-1);
			orderedRe.save(order);
		}
		
		return true;
	}

}
