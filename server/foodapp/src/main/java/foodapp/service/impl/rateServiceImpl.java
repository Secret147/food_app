package foodapp.service.impl;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodapp.dto.rateDTO;
import foodapp.entity.dish;
import foodapp.entity.rate;
import foodapp.entity.user;
import foodapp.respository.dishRepo;
import foodapp.respository.rateRepo;
import foodapp.respository.userRepo;
import foodapp.security.jwt.JwtProvider;
import foodapp.service.rateService;

@Service
public class rateServiceImpl implements rateService {

	@Autowired
	private userRepo userRe;
	
	@Autowired
	private rateRepo rateRe;
	
	@Autowired
	private JwtProvider provider;
	
	@Autowired
	private dishRepo dishRe;

	@Override
	public void newEvalute(String token,rateDTO rate) {
		String email = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(email).orElseThrow();
		rate rateEntity = new rate();
		rateEntity.setDish(rate.getDish());
		rateEntity.setUser(user);
		rateEntity.setEvalute(rate.getEvalute());
		rateEntity.setRate(rate.getRate());
		rateRe.save(rateEntity);
		
		double newRate = rateRe.AvgRate(rate.getDish().getId());
		dish dish = dishRe.findById(rate.getDish().getId()).orElseThrow();
		dish.setRate(newRate);
		dishRe.save(dish);
		
		
		
		
	}

	@Override
	public List<rate> getListReview(Long dish_id) {
		List<rate> rates= rateRe.findByDishId(dish_id);
		Collections.reverse(rates);
		return rates;
	}

}
