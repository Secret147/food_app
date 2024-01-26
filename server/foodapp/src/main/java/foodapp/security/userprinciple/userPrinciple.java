package foodapp.security.userprinciple;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

import foodapp.entity.user;
import lombok.Data;

@Data
public class userPrinciple implements UserDetails{
	private Long id;
	private String name;
	private String phone;
	private String address;
	
	private String email;
	private String image;
	private String birth;
	private Collection<? extends GrantedAuthority> roles;
	@JsonIgnore
	private String password;
	public static userPrinciple build(user user) {
		List<GrantedAuthority> authorities = user.getRoles().stream().map(role ->
		new SimpleGrantedAuthority(role.getName().name())).collect(Collectors.toList());
		return new userPrinciple(
				user.getId(),
				user.getName(),
				user.getPhone(),
				user.getAddress(),
				
				user.getEmail(),
				user.getImage(),
				user.getBirth(),
				authorities,
				user.getPassword()
				);
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return roles;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return password;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return email;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	public userPrinciple(Long id, String name, String phone, String address, String email, String image, String birth,
			Collection<? extends GrantedAuthority> roles, String password) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.image = image;
		this.birth = birth;
		this.roles = roles;
		this.password = password;
	}

	

}
