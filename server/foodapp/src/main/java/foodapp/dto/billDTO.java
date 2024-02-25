package foodapp.dto;

import java.util.List;

import lombok.Data;
import foodapp.entity.*;

@Data
public class billDTO {

	private String description;
	private Long totalprice;
	private String paymentmethod;
	private Long discout;
	private Long delivery;
	private String location;
	private List<ordered> carts;
	private String create_at;
	public billDTO() {
		// TODO Auto-generated constructor stub
	}

}
