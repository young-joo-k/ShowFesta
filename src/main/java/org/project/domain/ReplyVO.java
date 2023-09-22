package org.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno;
	private Long b_num;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
	
	
}
