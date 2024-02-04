package foodapp.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
@Entity
@Data
public class ordered {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Long quantity;
	
	private Long timedelivery;
	
	private Long pricedelivery;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn
	private bill bill;
	
	@ManyToOne
	@JoinColumn(name = "user_id",referencedColumnName = "id")
	private user user;
	
	@ManyToOne
	@JoinColumn(name = "dish_id",referencedColumnName = "id")
	private dish dish;

}
