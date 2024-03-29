package foodapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodapp.entity.dish;
import foodapp.respository.dishRepo;
import foodapp.service.dishService;

@Service
public class dishServiceImpl implements dishService {
	@Autowired
	private dishRepo dishRe;

	public dishServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<dish> findPopualar() {
		return dishRe.findPopular();
	}

	@Override
	public List<dish> findByType(String type) {
		// TODO Auto-generated method stub
		return dishRe.findByType(type);
	}

	@Override
	public dish getDetailDish(Long id) {
		// TODO Auto-generated method stub
		return dishRe.findById(id).orElseThrow();
	}

	@Override
	public List<dish> findRecommend() {
		
		return dishRe.findRecommend();
	}

	@Override
	public List<dish> findNewest() {
		// TODO Auto-generated method stub
		return dishRe.findNewest();
	}

	@Override
	public List<dish> findTrending() {
		// TODO Auto-generated method stub
		return dishRe.findTrending();
	}

	@Override
	public List<dish> findFeatured() {
		// TODO Auto-generated method stub
		return dishRe.findFeatured();
	}

}
