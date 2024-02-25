package foodapp.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;



@Entity
@Data
public class bill {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String description;
	private Long totalprice;
	private String paymentmethod;
	private Long discout;
	private Long delivery;
	private String location;
	
	@Column(columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date created_at;
	
	@PrePersist
    protected void onCreate() {
        created_at = new Date();
    }
	@OneToMany(mappedBy = "bill")
	@JsonIgnore
    private List<ordered> orders = new ArrayList<>();
    
    @ManyToOne
    @JsonBackReference
	@JoinColumn(name = "shipper_id",referencedColumnName = "id")
    private shipper shipper;
    
    @ManyToOne
	@JoinColumn(name = "user_id",referencedColumnName = "id")
	private user user;

}
