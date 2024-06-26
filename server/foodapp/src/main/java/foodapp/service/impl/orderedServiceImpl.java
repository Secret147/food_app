package foodapp.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
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
import java.util.Random;

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
		List<ordered> orderResponse = new ArrayList<>();
		for(ordered x : orders) {
			if(x.getBill()==null) {
				orderResponse.add(x);
			}
		}
		Collections.reverse(orderResponse);
		return orderResponse;
	}

	@Override
	public boolean newOrder(orderedDTO orderedDTO, String token) {
		ordered ordered = new ordered();
		ordered ordercheck = new ordered();
		boolean check = false;
		String email = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(email).orElseThrow();
		List<ordered> orderList = orderedRe.findByDishIdAndUserId(orderedDTO.getDish().getId(),user.getId());
		for(ordered x : orderList) {
			if(x.getBill()==null) {
				ordered = x;
				check = true;
				break;
			}
		}
		if(check) {		
			ordered.setQuantity(orderedDTO.getQuantity()+ ordered.getQuantity());
			orderedRe.save(ordered);
			return true;
		}
		else {		
			Random random = new Random();
	        Long time = random.nextLong(50);
			ordered.setUser(user);
			ordered.setDish(orderedDTO.getDish());
			ordered.setQuantity(orderedDTO.getQuantity());
			ordered.setTimedelivery(time);
			orderedRe.save(ordered);
			return true;
		}
		
	}

	@Override
	public boolean addQuantity(ordered order, String token) {
		String email = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(email).orElseThrow();
		order.setQuantity(order.getQuantity());
		order.setUser(user);
		orderedRe.save(order);
		return true;
	}

	@Override
	public boolean removeQuantity(ordered order, String token) {
		
			String email = provider.getUserNameFromToken(token);
			user user = userRe.findByEmail(email).orElseThrow();
			order.setUser(user);
			order.setQuantity(order.getQuantity());
			orderedRe.save(order);
		
		
		return true;
	}

	@Override
	public boolean deleteOrdered(String token, Long id) {
		String email = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(email).orElseThrow();
		ordered order = orderedRe.findByIdAndUserId(id, user.getId());
		orderedRe.delete(order);
		
		return true;
	}

}
