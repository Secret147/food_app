package foodapp.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodapp.converter.billConverter;
import foodapp.dto.billDTO;
import foodapp.entity.bill;
import foodapp.entity.ordered;
import foodapp.entity.user;
import foodapp.respository.billRepo;
import foodapp.respository.orderedRepo;
import foodapp.respository.userRepo;
import foodapp.security.jwt.JwtProvider;
import foodapp.service.billService;

@Service
public class billServiceImpl implements billService{
	
	@Autowired
	private JwtProvider provider;
	
	@Autowired
	private userRepo userRe;
	
	@Autowired
	private orderedRepo orderedRe;
	
	@Autowired
	private billRepo billRe;
	
	@Autowired
	private billConverter billCo;

	public billServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void saveBill(String token, billDTO billDTO) {
		String email = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(email).orElseThrow();
		bill billEntity = new bill();
		billEntity =  billCo.toEntity(billDTO);
		billEntity.setLocation(billDTO.getLocation().equals("home") ? user.getAddress() : billDTO.getLocation());
		billEntity.setUser(user);
		billRe.save(billEntity);
		for(ordered x: billDTO.getCarts()) {
			x.setBill(billEntity);
			x.setUser(user);
			orderedRe.save(x);
		}
	}

	@Override
	public List<billDTO> getListBill(String token) {
		String email = provider.getUserNameFromToken(token);
		user user = userRe.findByEmail(email).orElseThrow();
		List<bill> listBill = billRe.findAllByUser(user);
		
		List<billDTO> listBillDTO = new ArrayList<>();
		for(bill x: listBill) {
			billDTO bill = new billDTO();
			bill = billCo.toDTO(x);
			bill.setCarts(orderedRe.findByBillId(x.getId()));
			listBillDTO.add(bill);
		   
		}
		Collections.reverse(listBillDTO);
		return listBillDTO;
	}

}
