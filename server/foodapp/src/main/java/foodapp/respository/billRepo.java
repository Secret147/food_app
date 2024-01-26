package foodapp.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.bill;

public interface billRepo extends JpaRepository<bill, Long>{

}
