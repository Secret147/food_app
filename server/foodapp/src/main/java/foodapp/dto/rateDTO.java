package foodapp.dto;

import foodapp.entity.dish;
import lombok.Data;

@Data
public class rateDTO {
	private double rate;
	private String evalute;
	dish dish;

	

}
