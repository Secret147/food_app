package foodapp.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.shipper;

public interface shipperRepo extends JpaRepository<shipper, Long> {

}
