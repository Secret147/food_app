package foodapp.dto;

import java.util.HashSet;
import java.util.Set;

import foodapp.entity.role;
import lombok.Data;

@Data
public class userDTO {

	
	private String name;
	private String phone;
	private String address;
	private String description;
	private String email;
	private String image;
	private String birth;
	private String password;
	Set<String> roles= new HashSet<>();

}
