package org.project.domain;

import lombok.Data;

@Data
public class ScheduleVO {
	
	//유형
	private String genre;
	
	//그 날짜에 있는 총 갯수
	private int num;
}
