package foodapp.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;


@Entity
@Data
public class user {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String phone;
	private String address;
	private String description;
	private String email;
	private String image;
	private String birth;
	private String password;
	
	@OneToMany(mappedBy = "user")
	@JsonIgnore
	List<cart> orders = new ArrayList<>();
	
	 @ManyToMany(fetch = FetchType.EAGER)
	   Set<role> roles= new HashSet<>();
	
	@OneToMany(mappedBy = "user")
	@JsonIgnore
	List<rate> rates = new ArrayList<>();

	public user(String name, String phone, String address, String description, String email, String image, String birth,
			String password) {
		super();
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.description = description;
		this.email = email;
		this.image = image;
		this.birth = birth;
		this.password = password;
		
		
	}
	public user() {
		
	}
	
	
	
	
}
