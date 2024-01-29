package foodapp.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.ordered;

public interface orderedRepo extends JpaRepository<ordered, Long> {
	List<ordered> findAllByUserId(Long id);

}
