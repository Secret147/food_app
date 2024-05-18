package foodapp.dto;

import lombok.Data;

@Data
public class ResetPasswordDTO {

	String newPassword;
	String oldPassword;
	Long userId;
	

}
