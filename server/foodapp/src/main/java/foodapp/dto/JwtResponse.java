package foodapp.dto;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;

@Data
public class JwtResponse {
	String token;
	private String type = "Bearer";
	private String email;
	private String image;
	private Collection<? extends GrantedAuthority> roles;
	
public JwtResponse(String token, String email,String image,Collection<? extends GrantedAuthority> authorities) {
		
		this.token = token;
		this.email = email;
		this.image = image;
		this.roles = authorities;
	}
    
}
