package foodapp.service;

import java.util.List;

import foodapp.entity.dish;

public interface dishService {
	List<dish> findPopualar();
	List<dish> findRecommend();
	List<dish> findNewest();
	List<dish> findFeatured();
	List<dish> findTrending();
	List<dish> findByType(String type);
	dish getDetailDish(Long id);

}
