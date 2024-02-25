package foodapp.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.bill;
import foodapp.entity.ordered;

public interface orderedRepo extends JpaRepository<ordered, Long> {
	List<ordered> findAllByUserId(Long id);
	List<ordered> findByDishIdAndUserId(Long dish_id,Long user_id);
	ordered findByIdAndUserId(Long ordered_id,Long user_id);
	List<ordered> findByBillId(Long id);

}
