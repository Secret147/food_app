package foodapp.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

@Entity
@Data
public class rate {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private int rate;
	private String evalute;
	
	@ManyToOne
	@JoinColumn(name = "user_id",referencedColumnName = "id")
	private user user;
	
	@ManyToOne 
	@JoinColumn(name = "dish_id",referencedColumnName = "id")
	private dish dish;
	

}
