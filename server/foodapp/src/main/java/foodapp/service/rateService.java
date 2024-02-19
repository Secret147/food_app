package foodapp.service;

import java.util.List;

import foodapp.dto.rateDTO;
import foodapp.entity.dish;
import foodapp.entity.rate;

public interface rateService {
	void newEvalute(String token, rateDTO rate );
    List<rate> getListReview(Long dish_id); 
}
