package foodapp.service;

import foodapp.model.mailStructure;

public interface mailService {
	void sendMail(String mail, mailStructure mailStructure);

}
