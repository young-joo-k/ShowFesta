package org.project.domain;

import lombok.Data;

@Data
public class MemberVO {
	private Long userNum;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private int checked;
	private int validuser;
	private String filename;

	
}
