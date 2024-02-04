package foodapp.service;

import java.util.List;

import foodapp.dto.orderedDTO;
import foodapp.entity.dish;
import foodapp.entity.ordered;

public interface orderedService {
	List<ordered> findOrderByToken(String token);
	boolean newOrder(orderedDTO orderDTO, String token);
	boolean addQuantity(ordered order,String token);
	boolean removeQuantity(ordered order,String token);
	

}
