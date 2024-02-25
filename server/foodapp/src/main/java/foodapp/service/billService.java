package foodapp.service;

import java.util.List;

import foodapp.dto.billDTO;
import foodapp.entity.*;

public interface billService {
	void saveBill(String token,billDTO bill);
	List<billDTO> getListBill(String token);
	
}
