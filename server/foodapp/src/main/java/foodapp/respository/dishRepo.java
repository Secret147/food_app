package foodapp.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.dish;

public interface dishRepo extends JpaRepository<dish, Long> {

}
