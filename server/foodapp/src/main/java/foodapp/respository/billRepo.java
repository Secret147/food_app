package foodapp.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.bill;
import foodapp.entity.user;

public interface billRepo extends JpaRepository<bill, Long>{
	List<bill> findAllByUser(user user);

}
