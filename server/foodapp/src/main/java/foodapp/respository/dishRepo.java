package foodapp.respository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import foodapp.entity.dish;
@Repository
public interface dishRepo extends JpaRepository<dish, Long> {
	
	@Query(value = "SELECT * \r\n"
			+ "FROM foodapp.dish as d \r\n"
			+ "ORDER BY d.purchases DESC\r\n"
			+ "LIMIT 15", nativeQuery = true)
    List<dish> findPopular();
    
    @Query(value = "SELECT * \r\n"
			+ "FROM foodapp.dish as d \r\n"
			+ "ORDER BY d.price DESC\r\n"
			+ "LIMIT 15", nativeQuery = true)
    List<dish> findRecommend();
    
    @Query(value = "SELECT *\r\n"
    		+ "			FROM foodapp.dish as d \r\n"
    		+ "			ORDER BY d.purchases asc           \r\n"
    		+ "			LIMIT 15", nativeQuery = true)
    List<dish> findFeatured();
    
    @Query(value = "SELECT * FROM foodapp.dish \r\n"
    		+ "limit 15;", nativeQuery = true)
    List<dish> findNewest();
    
    @Query(value = "SELECT *\r\n"
    		+ "			FROM foodapp.dish as d \r\n"
    		+ "			ORDER BY d.purchases asc , d.price asc            \r\n"
    		+ "			LIMIT 15", nativeQuery = true)
    List<dish> findTrending();
    
    List<dish> findByType(String type);

}
