package foodapp.converter;

import org.springframework.stereotype.Component;

import foodapp.dto.billDTO;
import foodapp.entity.bill;

@Component
public class billConverter {

	public bill toEntity(billDTO billDTO) {
		bill billEntity = new bill();
		billEntity.setDelivery(billDTO.getDelivery());
		billEntity.setDescription(billDTO.getDescription());
		billEntity.setDiscout(billDTO.getDiscout());
		
		billEntity.setTotalprice(billDTO.getTotalprice());
		billEntity.setOrders(billDTO.getCarts());
		billEntity.setPaymentmethod(billDTO.getPaymentmethod());
		return billEntity;
	}
	public billDTO toDTO(bill billEntity) {
		billDTO billDTO = new billDTO();
		billDTO.setDelivery(billEntity.getDelivery());
		billDTO.setDescription(billEntity.getDescription());
		billDTO.setDiscout(billEntity.getDiscout());
		billDTO.setLocation(billEntity.getLocation() );
		billDTO.setTotalprice(billEntity.getTotalprice());
		String time = billEntity.getCreated_at().toString();
		String[] tach = time.split(" ");
		String date = tach[0];
		String[] tach2 = date.split("-");
		String result = "";
		for(int i=tach2.length-1;i>=0;i--) {
			result += tach2[i];
			if(i>0) {
				result +="/";
			}
		}
	    billDTO.setCreate_at(result);
		billDTO.setPaymentmethod(billEntity.getPaymentmethod());
		return billDTO;
	}

}
