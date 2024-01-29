package foodapp.service;

import java.util.List;

import foodapp.entity.dish;

public interface dishService {
	List<dish> findPopualar();
	List<dish> findByType(String type);

}
