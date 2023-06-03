package com.multi.mvc.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;
	private String userId;
	private String password;
	private String role;
	private String name;
	private String email;
	private String kakaoToken;
	private String address;
	private String status;
}
