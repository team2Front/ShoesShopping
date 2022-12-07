package domain;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userName;
	private String userPassword;
	private String phoneNumber;
	private String userAddress;
	private String userType;
	private String userEmail;
}
