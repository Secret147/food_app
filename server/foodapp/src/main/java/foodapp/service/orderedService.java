package foodapp.service;

import java.util.List;

import foodapp.entity.ordered;

public interface orderedService {
	List<ordered> findOrderByToken(String token);

}
