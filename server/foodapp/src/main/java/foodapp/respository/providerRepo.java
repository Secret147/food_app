package foodapp.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.provider;

public interface providerRepo extends JpaRepository<provider, Long> {

}
