package foodapp.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import foodapp.entity.dish;
import foodapp.entity.rate;

public interface rateRepo extends JpaRepository<rate, Long>{
	
	@Query(value = "SELECT ROUND( AVG(foodapp.rate.rate),2 )\r\n"
			+ "FROM foodapp.rate \r\n"
			+ "WHERE foodapp.rate.dish_id = ?", nativeQuery = true)
    double AvgRate(Long dishId);
	
	@Query(value = "SELECT count(rate.dish_id) \r\n"
			+ "FROM foodapp.rate\r\n"
			+ "where rate.dish_id=?;", nativeQuery = true)
	int countReview(Long dish_id);
    
	List<rate> findByDishId(Long dish_id);
}
