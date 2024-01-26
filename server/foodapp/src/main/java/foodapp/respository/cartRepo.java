package foodapp.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.cart;

public interface cartRepo extends JpaRepository<cart, Long>{

}
