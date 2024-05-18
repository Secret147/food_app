package foodapp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.PrePersist;
import lombok.Data;

@Entity
@Data
public class rate {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private double rate;
	private String evalute;
	
	private Date created_at;
	
	@PrePersist
    protected void onCreate() {
        created_at = new Date();
    }
	
	@ManyToOne
	@JoinColumn(name = "user_id",referencedColumnName = "id")
	private user user;
	
	@ManyToOne 
	@JoinColumn(name = "dish_id",referencedColumnName = "id")
	private dish dish;
	

}
