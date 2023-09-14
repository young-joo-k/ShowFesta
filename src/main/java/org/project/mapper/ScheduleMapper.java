package org.project.mapper;

import org.project.domain.ScheduleVO;

public interface ScheduleMapper {

	public ScheduleVO getCategory(String genre);
	
	public int getMusical();
	
	public int getConcerts();
	
	public int getFestival();
	
	public String genre();
	
}
