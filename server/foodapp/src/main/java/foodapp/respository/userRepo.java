package foodapp.respository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import foodapp.entity.user;

public interface userRepo extends JpaRepository<user, Long> {
	Optional<user> findByEmail(String email);
	boolean existsByEmail(String email);

}
