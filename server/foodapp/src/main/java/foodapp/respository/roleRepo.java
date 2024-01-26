package foodapp.respository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.role;
import foodapp.model.roleName;

public interface roleRepo extends JpaRepository<role, Long> {
	Optional<role> findByName(roleName name);

}
