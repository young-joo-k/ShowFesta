package org.project.mapper;

import org.project.domain.ScheduleVO;

public interface ScheduleMapper {

	public ScheduleVO getCategory(String genre);
	
	public int selectCnt();
	
	public String genre();
	
	
	
}
