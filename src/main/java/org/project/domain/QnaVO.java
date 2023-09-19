package org.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	private String id;
	private Long b_num;
	private String b_title;
	private String b_content;
	private String b_writer;
	private Date regdate;
	private Date updatedate;
}
