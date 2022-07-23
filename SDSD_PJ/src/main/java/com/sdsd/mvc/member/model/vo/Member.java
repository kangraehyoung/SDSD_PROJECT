package com.sdsd.mvc.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	
	private String email;
	
	private String password;
	
	private String password2;
	
	private String name;
	
	private String nickName;
	
	private String phone;
	
	private String gender;
	
	private Date BDay;
	
	private String address;
	
	private String introduce;
	
	private String status;
	
}
