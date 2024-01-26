package foodapp.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.JoinColumn;
import lombok.Data;

@Entity
@Data
public class dish {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String name;
	private Long price;
	private String image;
	private String position;
	private String description;
	private String type;
	private String purchases;
	
	@OneToMany(mappedBy = "dish")
	@JsonIgnore
	List<cart> orders = new ArrayList<>();
	
	@OneToMany(mappedBy = "dish")
	@JsonIgnore
	List<rate> rates = new ArrayList<>();
	
	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "provider_id",referencedColumnName = "id")
	private provider provider;
	

}
